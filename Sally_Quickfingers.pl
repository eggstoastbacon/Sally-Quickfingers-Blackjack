my $permissions = 0;
my $xplatinum = 0;
my $xgold = 0;
my $xsilver = 0;
my $xcopper = 0;
my $client1 = 0;
my $client2 = 0;
my $server = 0;
my $client = 0;
$winsinarow = 0;
$wins = 0;
$loss = 0;
$tie = 0;
$ulost = 0;
$gamesplayed = 0;
$moneyin = 0;
$moneyout = 0;
$locked = 0;

sub DealCard
{
	@cards = (1,1,2,3,4,5,6,7,8,9,10,10,10);
	#rand @array
	$returnvalue = $cards[int(rand(scalar @cards))];
	return $returnvalue;
}

sub EVENT_SAY
{
my $deal = quest::saylink("HIT ME");
my $stay = quest::saylink("STAY");
	if($text=~/hail/i)
		{
			quest::say("Greetings! Want to play balackjack? Hand me your PLATINUM to begin! All games return double on win! I only bet with 500p or less!");
		}
	if($text=~/deal/i && $name =~ m/$playername/i)
		{
			if($permissions == 1)
				{
                    quest::stoptimer ("timeout");
					quest::settimer ("timeout",120);
					$client1 = DealCard();
					$client2 = DealCard();
					$tempserver = DealCard();
					my $tempclient = ($client1+$client2);
					$client = $tempclient;
					$hiddencard = DealCard();
					$server = ($hiddencard + $tempserver);
					quest::say("The dealer passes you a $client1 and a $client2 giving you a total of $tempclient. The dealer is showing a $tempserver. Say [$deal] for another card or [$stay] to stay.");	
                    if($IQ == 1){
                        quest::emote("smirks.");		
                    }		
					$permissions = 2;
					#	if($server <= 14)
					#	{
					#		$newcard = DealCard();
					#		$server = ($server + $newcard);
					#		quest::say("The dealer deals themselves $newcard, giving you a total of $server.");
					#	}
				}
				else
				{
					quest::say("Have you bet?");
				}
		}


	if($text=~/HIT ME/i && $name =~ m/$playername/i)
		{		
            
			if($permissions == 2)
				{
                    quest::stoptimer ("timeout");
					quest::settimer ("timeout",120);
                    if($IQ == 1){
					$knowncard = $client
					} 
                    if($IQ == 0){
					$knowncard = ($client - $knowncard)
					}

					my $newcard = DealCard();
					$client = ($client + $newcard);
					quest::say("The dealer has handed you a $newcard, giving you a total of $client. Say [$deal] for another card or [$stay] to stay.");
					
				}
				if($permissions == 1)
				{
					quest::say("You must [deal] first!");
				}

				if($client > 21)
				{
							quest::say("Dealer reveals hidden card $hiddencard for a total of $server. The dealer wins, thanks for playing.");
                            $moneyin = ($moneyin + $xplatinum);
							$client = 0;
							$permissions = 0;
                            $locked = 0;
							$xplatinum = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
                            $winsinarow = 0;
							$ulost = 1;
                            $loss = ($loss + 1);
                            quest::stoptimer("timeout");
			    }


				if(($server <= 17 || ($knowncard > $server && $knowncard <= 17)) && $ulost < 1)
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver");
						}

							if($server > 21)
						{
							quest::say("Dealer reveals hidden card $hiddencard for a total of $server. You win with $client. Thanks for playing.");
							quest::givecash($xcopper*2,$xsilver*2,$xgold*2,$xplatinum*2);
                            $moneyout = ($moneyout + $xplatinum);
							$permissions = 0;
                            $locked = 0;
							$client = 0;
							$xplatinum = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
                            $winsinarow = ($winsinarow + 1);
                            $wins = ($wins + 1);
                            quest::stoptimer("timeout");
                            
                            quest::say("You have $winsinarow wins in a row.");
						}


		
		}
	if($text=~/STAY/i && $name =~ m/$playername/i)
		{

			if($permissions == 2 && $ulost < 1 )
				{
                    quest::stoptimer ("timeout");
					quest::settimer ("timeout", 120);
                    if($IQ == 1){
					$knowncard = $client
					} 
                    if($IQ == 0){
					$knowncard = ($client - $knowncard)
					}
#				if($server <= 14 && $client > $server)
#						{
#							$newcard = DealCard();
#							$server = ($server + $newcard);
#							quest::say("The dealer deals themselves $newcard, giving them a total of $server.");
#						}

						if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}

						if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}

					    if(($server < $client && $server < 21) && ($client != $server))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}

					    if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}
						if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}
						if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}
						if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}

						if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}

					    if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}

					    if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}
						if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}
						if($server < 17 || ($knowncard > $server && $knowncard <= 17))
						{
							$newcard = DealCard();
							$server = ($server + $newcard);
							$tempserver = ($tempserver + $newcard);
							quest::say("The dealer deals themselves a $newcard, showing $tempserver.");
						}

					if($client < $server && $server <= 21)
						{
							quest::say("Dealer reveals hidden card $hiddencard for a total of $server. The dealer wins, thanks for playing.");
                            $moneyin = ($moneyin + $xplatinum);
							$client = 0;
							$permissions = 0;
                            $locked = 0;
							$xplatinum = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
                            $winsinarow = 0;
							$ulost = 1;
                            $loss = ($loss + 1);
                            quest::stoptimer("timeout");
                            
						}
					if($client < $server && $server > 21)
						{
							quest::say("Dealer reveals hidden card $hiddencard for a total of $server. You win with $client. Thanks for playing.");
							quest::givecash($xcopper*2,$xsilver*2,$xgold*2,$xplatinum*2);
                            $moneyout = ($moneyout + $xplatinum);
							$permissions = 0;
                            $locked = 0;
							$client = 0;
							$xplatinum = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
                            $wins = ($wins + 1);
                            $winsinarow = ($winsinarow + 1);
                            quest::say("You have $winsinarow wins in a row.");
                            quest::stoptimer("timeout");
						}
					if($client > $server && $client <= 21)
						{
							quest::say("Dealer reveals hidden card $hiddencard for a total of $server. You win with $client. Thanks for playing.");
							quest::givecash($xcopper*2,$xsilver*2,$xgold*2,$xplatinum*2);
							$moneyout = ($moneyout + $xplatinum);
                            $locked = 0;
                            $permissions = 0;
							$client = 0;
							$xplatinum = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
                            $wins = ($wins + 1);
                            $winsinarow = ($winsinarow + 1);
                            quest::say("You have $winsinarow wins in a row.");
                            quest::stoptimer("timeout");
						}
					if($client > $server && $client > 21)
						{
							quest::say("Dealer reveals hidden card $hiddencard for a total of $server. The dealer wins, thanks for playing.");
							$moneyin = ($moneyin + $xplatinum);
                            $permissions = 0;
                            $locked = 0;
							$xplatinum = 0;
							$client = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
                            $winsinarow = 0;
							$ulost = 1;
                            $loss = ($loss + 1);
                            quest::stoptimer("timeout");
						}
						if($client == $server)
						{
							quest::say("Dealer reveals hidden card $hiddencard. You have $client and the dealer has $server. It's a tie you receive your money back.");
							quest::givecash($xcopper,$xsilver,$xgold,$xplatinum);
							$permissions = 0;
                            $locked = 0;
							$xplatinum = 0;
							$client = 0;
							$xgold = 0;
							$xsilver = 0;
							$xcopper = 0;
                            $tie = ($tie + 1);
                            quest::stoptimer("timeout");
                            quest::say("You have $winsinarow wins in a row.");
						}

				}
              
		}
        if($winsinarow == 7){
        quest::ding;
        quest::say("You are the luckiest person I have met, take this and get lost!");
        quest::summonitem(50857);
        $winsinarow = 0;
        }
}

sub EVENT_ITEM
{
    my $start =	quest::saylink("DEAL");
    if($locked == 1){quest::say("$playername is currently in a game, please wait for them to finish.");
    if($name =~ m/$playername/i){quest::say("$playername it looks like we are waiting for you to respond.");}
    quest::givecash($copper,$silver,$gold,$platinum);
    }
    
    if($locked != 1){
	if($permissions == 0)
		{

            if (($platinum > 500) || ($gold > 0 || $copper > 0 || $silver > 0)){        
            quest::say("I only deal with less than 500 platinum and only platinum coins.");
            quest::givecash($copper,$silver,$gold,$platinum);
           }
           if ($platinum <= 500 && $gold == 0 && $copper == 0 && $silver == 0){   
			#my $start =	quest::saylink("DEAL");
            quest::settimer ("timeout",120);
            $playername = $name;
			quest::say("Hi $name, your bet of $platinum platinum has been saved. You may [$start] the cards now.");
			$xplatinum = $platinum;
			$xgold = $gold;
			$xsilver = $silver;
			$xcopper = $copper;
			$permissions = 1;
			$ulost = 0;
            @brilliance = (0,0,0,0,1);
            $IQ = $brilliance[int(rand(scalar @brilliance))];
            quest::say("$gamesplayed games played since reset. W: $wins L: $loss T: $tie");
            quest::say("Money in: $moneyin p. Money out: $moneyout p.");
            $gamesplayed = ($gamesplayed + 1);
            $locked = 1;
           }
		}
       
	else
		{
            #my $start =	quest::saylink("DEAL");
			#quest::say("Your bet of $platinum platinum, $gold gold, $silver silver, $copper copper has been saved. You may [deal] the cards now.");
			quest::say("You've already bet. You may [$start], the cards now.");
            quest::givecash($copper,$silver,$gold,$platinum);
		} 
        }
}
sub EVENT_TIMER {
if ($timer eq "timeout") {
quest::stoptimer("timeout");
quest::say("It's been 2 minutes with no response, resetting.");
quest::givecash($copper,$silver,$gold,$platinum);
$locked = 0;
$permissions = 0;
}
}


