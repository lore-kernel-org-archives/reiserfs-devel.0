From: Hans Reiser <reiser@namesys.com>
Subject: Re: Why is Reiser4 slower then ReiserFS v3
Date: Tue, 28 Dec 2004 13:34:47 -0800
Message-ID: <41D1D177.4080800@namesys.com>
References: <231dafb5041227123867a2c873@mail.gmail.com> <200412272353.iBRNrUcv002561@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22928-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412272353.iBRNrUcv002561@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Dark Shadow <shadowofdarkness@gmail.com>, reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote:

>On Mon, 27 Dec 2004 13:38:12 MST, Dark Shadow said:
>
>  
>
>>I have three hard drives so I took a file from one and copied it to
>>the others and timed it
>>source drive /dev/hda Reiser3 Western Digital 40gb 7200rpm
>>target1 drive /dev/hdb Reiser4 Western Digital 80gb 7200rpm
>>target2 drive /dev/sda Reiser3 Seagate 160gb 7200rpm (SATA but still
>>same rpm as rest so it should be the same)
>>    
>>
>
>You may wish to run 'hdparm -T -t' on each drive and see what the *raw* speed
>is.  All drives are not created equal... ;)
>  
>
This is correct.  You should see negligible difference between the two 
for large files on the same drive.  Deletions however, see next email....

>>time cp ~/800mb.file /target1
>>real    0m41.409s
>>user    0m0.010s
>>sys     0m4.364s
>>    
>>
>
>  
>
>>time cp ~/800mb.file /target2
>>real    0m38.318s
>>user    0m0.017s
>>sys     0m5.627s
>>    
>>
>
>Similarly, you should try each one 3-5 times and get an average (for
>starters, if you have more than 800M of memory, the second time around it
>may all still be in cache, so the second time gets a hot-cache boost). It
>may be useful to run the command once and *ignore* its times, and then
>re-run the command 3 times and average those results (so all 3 times you
>actually *use* start from the same "previous command just finished" cache state).
>  
>

