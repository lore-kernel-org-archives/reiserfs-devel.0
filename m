From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4non-free
Date: Wed, 5 May 2004 12:46:16 +0400
Message-ID: <16536.43480.594608.500710@laputa.namesys.com>
References: <4097E691.9070001@myrealbox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4097E691.9070001@myrealbox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rhyotte <rhyotte@myrealbox.com>
Cc: reiserfs-list@namesys.com

Rhyotte writes:
 >    Hi all,
 >   I am a normal end user, and of course new to the reiser lists. I was 
 > curious enough about the new reiser to get fairly serious about "seeing" 
 > who / what / where / when ect...
 > @Hans - Sir on the one hand I honestly respect you and the crew making 
 > Reiser4 possible. OTOH, can you all please get this leagal wrangle 
 > sorted out? There are alot of end users who seriously want to get our 
 > hands on the shipping Reiser4 FS!! But please, dont make me see a 
 > "splash screen" upon every system bootup! The nvidia one is bad enough - 

(off-topic.)

If you are talking about nvidia splash screen during X Server startup,
just add

        Option "NoLogo" "1"          #Turn off logo display

To the "Device" section of your /etc/X11/XF86Config-4

Nikita.
