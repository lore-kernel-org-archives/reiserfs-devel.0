From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser4 / Reiserfs bonnie++ performance comparison
Date: Mon, 12 Jul 2004 18:58:53 +0400
Message-ID: <40F2A72D.9070601@namesys.com>
References: <20040709165924.27fabe63@philou.gramoulle.local> <40EEE5D7.7040306@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19580-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40EEE5D7.7040306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hans Reiser wrote:
> Philippe Gramoulle' wrote:
> 
>> Hello,
>>
>> Below are results from bonnie++ done on reiser4 and reiserfs.
>> Each result is an average of 5 runs.
>>
>> For Reiser4 i used default mkfs options and -o formatting=extents
>> For Reisefs i used default mount options and -o notails
>>
>> Assuming that default behavior of bonnie++ is to use twice the RAM of 
>> the server,
>> no reboot was done between consecutive runs
>>
>> Bonnie++ was run like this : bonnie++ -x 5 -d bonnie
>>
>> Hardware: Dell PowerEdge 2550 1GHz SMP, 1Go RAM, SCSI 15K RPM U160 
>> Seagate Cheetah X15 Disk
>> Software: Debian Sid + 2004.07.02 Reiser4 auto snapshot ( 2.6.7-mm4 )
>> .config file available here if interested: 
>> http://philou.org/linux/reiser4/config-2.6.7-mm4
>>
>> Biggest regression seems to be in deletes.
>>  
>>
> I would like to know exactly what is being done in sequential block 
> output phase of this benchmark. vs, please comment on that and why 
> reiser4 is slow at it.
> 

sequential block output of bonnie++ writes to a file by 8192-byte blocks with write(2).

Reiser4 does it similar to reiserfs which is known as fast filesystem. In my tests I get the following.
As you can see Per Char output is worse in reiser4 than in reiserfs.

Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
reiser4  (1)     1G 18408  81 29188  15 13575  14 18317  78 30200   9 257.1   1
          (2)     1G 17386  76 27335  15 13434  12 18617  79 30139   9 239.9   1
          (3)     1G 18633  82 25161  13 14119  12 18292  78 30178   9 236.6   1
          (4)     1G 17318  76 27457  15 12753  12 19083  81 29813   9 237.3   1
          (5)     1G 19211  84 25424  13 13865  12 17785  76 29839   8 245.9   1
-------------------------------------------------------------------------------
reiserfs (1)     1G 21027  93 25964  23 10808   5 14502  62 23672   6 245.6   0
          (2)     1G 22128  97 25173  21 10779   5 14354  62 23708   6 251.9   0
          (3)     1G 21154  93 25794  22 10638   5 14513  62 23676   6 248.9   0


>> I will gladly redo my benchmarks if you feel i did or missed something 
>> obviously important,
>> or you'd like me to test other FSes as well
>>
>> Comments are welcome.
>>
>> Thanks,
>>
>> Philippe
>>
>> -- 
>> Lycos Europe Noc
>>
>>
>>
>> Average of 5 runs with reiser4 ( no special mkfs options )
>>
>> Version  1.03       ------Sequential Output------ --Sequential Input- 
>> --Random-
>>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
>> --Seeks--
>> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
>> /sec %CP
>> localbox         2G 15357  93 29126  24    17855  24 15994     93 
>> 40185  26   322   1
>>                    ------Sequential Create------ --------Random 
>> Create--------
>>                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
>> -Delete--
>>              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
>> /sec %CP
>>                 16 19839  99 +++++ +++  7394 99.8 7632    100  +++++ 
>> +++ 7326 99.8
>>
>>
>> Average of 5 runs with reiser4 ( mkfs option -o formatting=extents)
>>
>> Version  1.03       ------Sequential Output------ --Sequential Input- 
>> --Random-
>>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
>> --Seeks--
>> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
>> /sec %CP
>> localbox         2G 15221  92 30467  25    17341  23 16059  94 40183  
>> 26   319   1
>>                    ------Sequential Create------ --------Random 
>> Create--------
>>                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
>> -Delete--
>>              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
>> /sec %CP
>>                 16 19728  99 +++++ +++  7361 99.8 7576     99 +++++ 
>> +++  7265 99.8
>>         
>> Average of 5 runs with reiserfs ( no special mount options )
>>
>> Version  1.03       ------Sequential Output------ --Sequential Input- 
>> --Random-
>>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
>> --Seeks--
>> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
>> /sec %CP
>> localbox         2G 16207  97 30432  30 16978  16 15100  91 38487  
>> 22   349   1
>>                    ------Sequential Create------ --------Random 
>> Create--------
>>                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
>> -Delete--
>>              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
>> /sec %CP
>>                 16 12433  99 +++++ +++    10349  96 11836     99 +++++ 
>> +++  9248 99.8
>>                   Average of 5 runs with reiserfs ( mount option -o 
>> notails)
>>
>> Version  1.03       ------Sequential Output------ --Sequential Input- 
>> --Random-
>>                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- 
>> --Seeks--
>> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  
>> /sec %CP
>> localbox         2G 16029  96 33199  33    16201  15 15226  91 38606  
>> 22   348   1
>>                    ------Sequential Create------ --------Random 
>> Create--------
>>                    -Create-- --Read--- -Delete-- -Create-- --Read--- 
>> -Delete--
>>              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  
>> /sec %CP
>>                 16 12423  99 +++++ +++ 10719  99 11767  99 +++++ 
>> +++    9241 99.4
>>
>>
>>
>>  
>>
> 
> 
> 


