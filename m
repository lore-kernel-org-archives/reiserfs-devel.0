From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging
 (was:Compatibility of  current 2.4.19.pending ...)
Date: Tue, 17 Sep 2002 02:53:03 +0200
Message-ID: <3D867CEF.1050809@mb.tu-ilmenau.de>
References: <3D7FDEA5.7040806@mb.tu-ilmenau.de> <3D81076E.6090408@mb.tu-ilmenau.de> <20020913113735.A6022@namesys.com> <3D826FB9.7030909@mb.tu-ilmenau.de> <20020914130239.D26664@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11485-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 09/14/2002 11:02 AM, Oleg Drokin wrote:
 > Hello!
 >
 > On Sat, Sep 14, 2002 at 01:07:37AM +0200, Manuel Krause wrote:
 >
 >>>>>So, for the overnight change to pre-kernel 7, where are the new
 >>>>>data-logging patches Hans even announced to lkml?
 >>>>
 >>??? Hello, Chris!
 >
 >
 > Chris said he'll either announce something on tuesday or pass the 
code to me to
 > finish it.
 >

I included this into my prayers.

 >
 >>Did I follow the thread "Re: [reiserfs-list] [BK] ReiserFS file write
 >>bug fix for 2.4" correctly that going to 2.4.20-pre7 that is without
 >>file_write (+) code should speed up (in my case copy actions) in
 >>comparison to 2.4.20-pre6?
 >
 >
 > No. file_write code should speed up writes that are done in big 
chunks (more
 > than 4k).
 >
 >
 >>I retested my backup session (see last mail) with 2.4.20-pre7 but have
 >>_NO_ ( <0,2% !!!) difference at all.
 >
 >
 > What tool do you use for backup?

Hey, Oleg, you should know this; I stayed with my simple but useful
scripts using "cp -ax A/. B/" for testing reiserfs performance on this
command related to my reiserfs partitions' content. That content is not
theoretical, it's living for about one month, then newly recreated --
and these backups showed up some issues in the past. ;-))

 > I certainly see the difference when doing
 >  dd if=/dev/zero of=somefile bs=1024k count=100

I didn't do dd related time comparisons though having the values for the
last months. Many months ago I found "bs=1M" to be more useful ;-)

 >
 > also when doing cp bigfile /another_disk/anotherfile
 >
 > Also very huge difference is seen when creating holes ;)
 > e.g compare time of seeking to 128Gb and writing one byte between
 > 2.4.20-pre7 and 2.4.20-pre6 ;)
 > Code for that was once posted on our mailing list.
 > When you will feel that 2.4.20-pre7 hanged, don't trust that feeling
 > and wait till the end of operation. ;)
 >

You're kind of joking?! "time <command>" should show the total lack of
time related performance, when [throughput] is divided by [time] or
not?! I calculated these values manually based upon the timings & df
values after copying. Yes, I want to show my personal engagement for the
reiserfs community, too.

 >
 >>Have I missed something?
 >
 >
 > To see the difference you need to fed FS with large chuncks of data.
 >

Thanks to you, Oleg,

Manuel


