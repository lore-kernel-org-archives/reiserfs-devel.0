From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: A WISH: Reiser4 patch for 2.6.14
Date: Fri, 11 Nov 2005 19:33:50 +0300
Message-ID: <4374C7EE.20001@namesys.com>
References: <1131353326.4553.4.camel@localhost.localdomain>	 <436F7ED5.1060106@namesys.com> <1131385665.4553.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1131385665.4553.13.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yusuf Iskenderoglu <enygma@dreadnought.hadiko.de>, ReiserFS Mailing List <reiserfs-list@namesys.com>, Reiserfs-dev <reiserfs-dev@namesys.com>

Hello

Yusuf Iskenderoglu wrote:
> Okay, thanks for the information. I will continue waiting.
> 

Well, here is the first attempt to relelase reiser4 for 2.6.14. Please try to
use it.
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14/reiser4-for-2.6.14-1.patch.gz


Consider it as an experimental thing. Note, it will probably not compile as a
module. Adding a line to mm/page-writeback.c the following line

EXPORT_SYMBOL(clear_page_dirty_for_io);

after clear_page_dirty_for_io()'s definition should fix that, though.



> On Mon, 2005-11-07 at 19:20 +0300, Vladimir V. Saveliev wrote:
>>Hello
>>
>>Yusuf Iskenderoglu wrote:
>>>Hello,
>>>
>>>I am not having a support issue, just a wish.
>>>It always takes many weeks until you put a patch for the reiser4
>>>filesystem for the most actual Linux version into your ftp server.
>>>In this case, 2.6.14 is already released for one week now, and there is
>>>still no patch available.
>>>
>>>I am not interested in patching the kernel with stuff from other/older
>>>patches.
>>>I just wish you be up-to-date
>>>
>>>Creating a patch for the actual kernel version simply cannot take you
>>>more than 1 Minute.
>>>
>>Sorry for delay with that. Code got big changes recently, we would like to test
>>it a bit.
> 
> 
> 

