From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Reiser4 / Reiserfs bonnie++ performance comparison
Date: Fri, 9 Jul 2004 16:59:24 +0200
Message-ID: <20040709165924.27fabe63@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19560-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>


 Hello,

Below are results from bonnie++ done on reiser4 and reiserfs.
Each result is an average of 5 runs.

For Reiser4 i used default mkfs options and -o formatting=extents
For Reisefs i used default mount options and -o notails

Assuming that default behavior of bonnie++ is to use twice the RAM of the server,
no reboot was done between consecutive runs

Bonnie++ was run like this : bonnie++ -x 5 -d bonnie

Hardware: Dell PowerEdge 2550 1GHz SMP, 1Go RAM, SCSI 15K RPM U160 Seagate Cheetah X15 Disk
Software: Debian Sid + 2004.07.02 Reiser4 auto snapshot ( 2.6.7-mm4 )
.config file available here if interested: http://philou.org/linux/reiser4/config-2.6.7-mm4

Biggest regression seems to be in deletes.

I will gladly redo my benchmarks if you feel i did or missed something obviously important,
or you'd like me to test other FSes as well

Comments are welcome.

Thanks,

Philippe

--
Lycos Europe Noc



Average of 5 runs with reiser4 ( no special mkfs options )

Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
localbox         2G 15357  93 29126  24	17855  24 15994	 93 40185  26   322   1
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 19839  99 +++++ +++  7394 99.8 7632	100  +++++ +++ 7326 99.8


Average of 5 runs with reiser4 ( mkfs option -o formatting=extents)

Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
localbox         2G 15221  92 30467  25	17341  23 16059  94 40183  26   319   1
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 19728  99 +++++ +++  7361 99.8 7576	 99 +++++ +++  7265 99.8
		 

Average of 5 runs with reiserfs ( no special mount options )

Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
localbox         2G 16207  97 30432  30 16978  16 15100  91 38487  22   349   1
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 12433  99 +++++ +++	10349  96 11836	 99 +++++ +++  9248 99.8
		 
		 
Average of 5 runs with reiserfs ( mount option -o notails)

Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
localbox         2G 16029  96 33199  33	16201  15 15226  91 38606  22   348   1
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 12423  99 +++++ +++ 10719  99 11767  99 +++++ +++	9241 99.4

