From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 for windows
Date: Tue, 18 Jan 2005 08:37:13 -0800
Message-ID: <41ED3B39.2000702@namesys.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41EA04B7.3050606@slaphack.com> <41EBEBF1.1050408@namesys.com> <200501171812.54199.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501171812.54199.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

Christian Iversen wrote:

>On Monday 17 January 2005 17:46, Hans Reiser wrote:
>  
>
>>David Masover wrote:
>>    
>>
>>>Hans Reiser wrote:
>>>[...]
>>>
>>>|> To start with, ntfs read access is still case insensitive, last I
>>>|> checked.  How deep does that go?
>>>|
>>>| In reiser4, it is just a directory plugin.
>>>
>>>Nono -- how do you give Windows, which is case insensitive, access to a
>>>case-sensitive filesystem?  For instance, how do you get a Windows-based
>>>backup program to back up a reiser4 partition from a Linux installation,
>>>if it has filenames that are identical except for case?
>>>      
>>>
>>This problem is insoluble.  Either make reiser4 case insensitive and use
>>it that way or educate the windows programs or live with bugs.  I see no
>>alternative.  Do you?
>>    
>>
>
>Actually, NTFS has case-sensitivity-support, but it's turned off by default. I 
>think a fair share of programs _should_ work, even though they all _ought_ to 
>work.
>
>Could reiser4 support case-crushing, so it would be more "windows-native"?
>
>  
>
It could, as a plugin.
