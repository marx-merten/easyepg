#!/usr/bin/perl

#      Copyright (C) 2019-2020 Jan-Luca Neumann
#      https://github.com/sunsettrack4/easyepg
#
#      Collaborators:
#      - DeBaschdi ( https://github.com/DeBaschdi )
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with easyepg. If not, see <http://www.gnu.org/licenses/>.

# ###############################
# VODAFONE MANIFEST URL PRINTER #
# ###############################

use strict;
use warnings;

binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";
use utf8;

use JSON;
use Time::Piece;
use Time::Seconds;

# READ CHANNEL FILE
my $channels;
{
	local $/; #Enable 'slurp' mode
	open my $fh, '<', "/tmp/compare.json" or die;
	$channels = <$fh>;
	close $fh;
}

# READ SETTINGS FILE
my $settings;
{
	local $/; #Enable 'slurp' mode
    open my $fh, '<', "settings.json" or die;
    $settings = <$fh>;
    close $fh;
}

# CONVERT JSON TO PERL STRUCTURES
my $channels_data  = decode_json($channels);
my $settings_data  = decode_json($settings);

# SET DAY SETTING
my $day_setting  = $settings_data->{'settings'}{'day'};
my $ds = "T00:00:00" ;
my $de = "T23:59:00" ;

# SET DATE VALUES
my $time1   = Time::Piece->new;
my $time2   = $time1 + 86400;
my $time3   = $time1 + 172800;
my $time4   = $time1 + 259200;
my $time5   = $time1 + 345600;
my $time6   = $time1 + 432000;
my $time7   = $time1 + 518400;
my $time8   = $time1 + 604800;
my $time9   = $time1 + 691200;
my $time_10 = $time1 + 777600;
my $time_11 = $time1 + 864000;
my $time_12 = $time1 + 950400;
my $time_13 = $time1 + 1036800;
my $time_14 = $time1 + 1123200;
my $time_15 = $time1 + 1209600;

my $date1   = $time1->strftime('%Y-%m-%d');
my $date2   = $time2->strftime('%Y-%m-%d');
my $date3   = $time3->strftime('%Y-%m-%d');
my $date4   = $time4->strftime('%Y-%m-%d');
my $date5   = $time5->strftime('%Y-%m-%d');
my $date6   = $time6->strftime('%Y-%m-%d');
my $date7   = $time7->strftime('%Y-%m-%d');
my $date8   = $time8->strftime('%Y-%m-%d');
my $date9   = $time9->strftime('%Y-%m-%d');
my $date_10 = $time_10->strftime('%Y-%m-%d');
my $date_11 = $time_11->strftime('%Y-%m-%d');
my $date_12 = $time_12->strftime('%Y-%m-%d');
my $date_13 = $time_13->strftime('%Y-%m-%d');
my $date_14 = $time_14->strftime('%Y-%m-%d');
my $date_15 = $time_15->strftime('%Y-%m-%d');

# DEFINE COMPARE DATA
my $new_name2id = $channels_data->{'newname2id'};
my $new_id2name = $channels_data->{'newid2name'};
my $old_name2id = $channels_data->{'oldname2id'};
my $old_id2name = $channels_data->{'oldid2name'};
my @configname  = @{ $channels_data->{'config'} };


#
# DOWNLOAD CHANNEL MANIFESTS
#

foreach my $configname ( @configname ) {
	
	# DEFINE IDs
	my $new_id = $new_name2id->{$configname};
		
	# FIND MATCH VIA NEW CHANNEL NAME + CONFIG NAME
	if( defined $new_id ) {
				
		# DAY 1
		if( $day_setting == 1 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date2$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-2
		} elsif( $day_setting == 2 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date3$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-3
		} elsif( $day_setting == 3 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date4$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-4
		} elsif( $day_setting == 4 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date5$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-5
		} elsif( $day_setting == 5 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date6$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-6
		} elsif( $day_setting == 6 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date7$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-7
		} elsif( $day_setting == 7 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date8$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-8
		} elsif( $day_setting == 8 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date9$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-9
		} elsif( $day_setting == 9 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date_10$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-10
		} elsif( $day_setting == 10 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date_11$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-11
		} elsif( $day_setting == 11 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date_12$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-12
		} elsif( $day_setting == 12 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date_13$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-13
		} elsif( $day_setting == 13 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date_14$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		# DAYS 1-14
		} elsif( $day_setting == 14 ) {
			print "curl --connect-timeout 2 --max-time 10 --retry 8 --retry-delay 0 --retry-max-time 5 -s 'https://tv-manager.vodafone.de/tv-manager/backend/auth-service/proxy/epg-data-service/epg/tv/data/period/$new_id/$date1$ds/$date_15$de/' | grep \"$new_id\" | jq '.' > mani/$new_id\n";
		}			

	} else {
		print STDERR "[ CHLIST WARNING ] CHANNEL \"$configname\" not found in channel list!\n";
	}
}
