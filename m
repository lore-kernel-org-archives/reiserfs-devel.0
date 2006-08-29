From: Toby Thain <toby@smartgames.ca>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 18:15:28 -0400
Message-ID: <0954BE4F-E3A4-4A59-B275-10C1D8DB5101@smartgames.ca>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>	 <20060828173721.GA11332@hello-penguin.com>	 <44F332D6.6040209@namesys.com>	 <1156801705.2969.6.camel@nigel.suspend2.net>	 <20060829045937.GA9181@localhost.hsdv.com>	 <op.te1sixuycigqcu@apollo13>	 <20060829143814.GA21868@hello-penguin.com>	 <op.te1yjbp7cigqcu@apollo13> <44F47FEB.9060005@namesys.com>	 <44F4880C.3050507@slaphack.com> <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com> <44F4914A.1010005@slaphack.com> <44F4979E.9020101@namesys.com> <44F49D7F.3010403@slaphack.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44F49D7F.3010403@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
Cc: ReiserFS List <reiserfs-list@namesys.com>


On 29-Aug-06, at 4:03 PM, David Masover wrote:

> Hans Reiser wrote:
>> David Masover wrote:
>>>   John Carmack is pretty much the only superstar programmer in video
>>> games, and after his first fairly massive attempt to make Quake 3  
>>> have
>>> two threads (since he'd just gotten a dual-core machine to play  
>>> with)
>>> actually resulted in the game running some 30-40% slower than it did
>>> with a single thread.
>> Do the two processors have separate caches, and thus being overly  
>> fined
>> grained makes you memory transfer bound or?
>
> It wasn't anything that intelligent.  Let me see if I can find it...
>
> Taken from
> http://techreport.com/etc/2005q3/carmack-quakecon/index.x?pg=1
>
> "Graphics accelerators are a great example of parallelism working  
> well, he noted, but game code is not similarly parallelizable. ...
>
> The downside is, most game developers are working on Windows, for  
> which FS compression has always sucked.  Thus, they most often  
> implement their own compression, often something horrible, like  
> storing the whole game in CAB or ZIP files, and loading the entire  
> level into RAM before play starts, making load times less relevant  
> for gameplay.  Reiser4's cryptocompress would be a marked  
> improvement over that, but it would also not be used in many games.


Gamer systems, whether from coder's or player's p.o.v., would appear  
fairly irrelevant to reiserfs and this list. I'd trust Carmack's eye  
candy credentials but doubt he has much to say about filesystems or  
server threading...
