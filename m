From: Nikita Danilov <Nikita@Clusterfs.COM>
Subject: Re: Unattended mongo benchmark?
Date: Sat, 31 Jul 2004 15:00:33 +0400
Message-ID: <16651.31697.196453.840062@laputa.namesys.com>
References: <20040730204212.19E6015E7C@mail03.powweb.com>
	<410B2BEA.6090508@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410B2BEA.6090508@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

Hans Reiser writes:
 > David Dabbs wrote:
 > 
 > >I was wondering about a solution to running mongo benchmarks unattended.
 > >If one does not exist, how about the following as a 'straw man' approach?
 > >
 > >Create a script (say mongo_auto.sh) that takes one numeric parameter. The
 > >parameter would indicate which action/mongo script to perform next. The
 > >parameters and their associated actions might be something like the
 > >following:
 > >
 > >Parameter: N=0
 > >- Make a copy of /etc/inittab
 > >- Add a 'sysinit' entry in /etc/inittab that runs "/path/mongo_auto.sh 1"
 > >- Reboot
 > >
 > >
 > >Parameter: N
 > >- Run the Nth mongo run (specified in a case statement in mongo_auto.sh)0.
 > >- If (ran_without_error)
 > >     N = N + 1
 > >     if ( N <= Last_Run_Number)
 > >        - Update /etc/inittab entry to run "/path/mongo_auto.sh N"
 > >        - Reboot
 > >     else
 > >        - Clean up/restore /etc/inittab
 > >        - Run /path/to/mongo_parse.sh 1.log 2.log... > comparison.html
 > >
 > >
 > >Or, to limit inittab mods to the start/end, the script could read/write a
 > >.mongo_auto file that specifies the next run number to take.
 > >
 > >
 > >David
 > >
 > >
 > >
 > >
 > >
 > >  
 > >
 > sounds good.

Yes, Namesys has scripts to run arbitrary sequence of benchmarks with
reboots in between. These scripts plug themselves into
/etc/rc.d/boot.local rather than in /etc/inittab though.

 > 

Nikita.
