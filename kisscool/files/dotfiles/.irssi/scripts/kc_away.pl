#!/usr/bin/perl
#
# Script d'away pour Irssi
# by KissCool

use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '1.00';
%IRSSI = (
    authors     => 'KissCool',
    contact     => 'bayle.philippe@gmail.com',
    name        => 'Kc Away',
    description => 'Another personalized away script ',
    license     => 'GPLv2',
);

# variables globales
my ($nick, $server_bitlbee);

$nick = "KissCool";
$server_bitlbee = "Bitlbee";


# Usage: /KC <msg>
# Met en état non away avec le message suivant dans le nick
sub cmd_kc {
	# éléments majoritairement inutiles
	my ($data, $server, $witem) = @_;
	my @servers = Irssi::servers();
	
	if (!$data){
		Irssi::print("Message must be given");
		return;
	}
	
	# substitution des nicks
	my $nick_sub = $data;
	$nick_sub =~ s/\s+/\`/g;
	
	# on fait le tour des serveurs
	foreach my $serv (@servers){
		if ($serv->{usermode_away} == 1){
			$serv->command("AWAY");
		}
		if ($serv->{chatnet} !~ /$server_bitlbee/i){
			$serv->command("NICK $nick|$nick_sub");
		}
	} 
}

# Usage: /KCA <msg>
# Met en état away avec le message suivant dans le nick
sub cmd_kca {
	# éléments majoritairement inutiles
	my ($data, $server, $witem) = @_;
	my @servers = Irssi::servers();
	
	if (!$data){
		Irssi::print("Message must be given");
		return;
	}
	
	# substitution des nicks
	my $nick_sub = $data;
	$nick_sub =~ s/\s+/\`/g;
	
	# on fait le tour des serveurs
	foreach my $serv (@servers){
		if ($serv->{usermode_away} == 0){
			$serv->command("AWAY $data");
		}
		if ($serv->{chatnet} !~ /$server_bitlbee/i){
			$serv->command("NICK $nick|$nick_sub");
		}
	} 
}
# Usage: /WA
# Sors de l'état away avec le nick $nick
sub cmd_wa {
	# éléments majoritairement inutiles
	my ($data, $server, $witem) = @_;
	my @servers = Irssi::servers();
	
	# on fait le tour des serveurs
	foreach my $serv (@servers){
		if ($serv->{usermode_away} == 1){
			$serv->command("AWAY");
		}
		if ($serv->{chatnet} !~ /$server_bitlbee/i){
			$serv->command("NICK $nick");
		}
	} 
}

Irssi::command_bind('kc', 'cmd_kc');
Irssi::command_bind('kca', 'cmd_kca');
Irssi::command_bind('wa', 'cmd_wa');
