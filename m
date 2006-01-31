From: Hans Reiser <reiser@namesys.com>
Subject: Re: Want to contribute
Date: Mon, 30 Jan 2006 23:59:56 -0800
Message-ID: <43DF18FC.6040605@namesys.com>
References: <1138611843.2999.14.camel@embd-olivier.naturesoft.net> <200601302255.10373.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601302255.10373.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bandan Das <bandan@naturesoft.net>
Cc: Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com

Peter van Hardenberg wrote:

>Hi Bandan,
>
>I found a couple relatively easy bugs while working with the "metas" virtual 
>directories. Build a metas-enabled Reiser4 kernel, and try tab completion 
>within the root of a file like this:
>
>cd file/<tab>
>
>it will crash your console.
>
>Also, echoing values into plugins to change their values from the commandline 
>does not work, possibly due to appended newlines. A fix for this would also 
>be most excellent.
>
>I have a Reiser4 developers wiki targeted to people trying to learn R4. I 
>encourage you to both read and contribute to it! It is available at 
>http://pvh.ca/trac/wiki/reiser4
>
>-pvh
>
>
>On January 30, 2006 01:04 am, Bandan Das wrote:
>  
>
>>Hi!
>>I am Bandan and new to the list. I have been a fan of ReiserFS for
>>around a year now and would like to contribute to it in the form of
>>fixing some minor bug. As Nikita suggested to me on the IRC channel,
>>adding comments is also a good idea but I would more like to contribute
>>in the form of code :) I am a good C programmer and have hands on
>>experience in Linux kernel programming. Can anyone suggest something?
>>Thanks
>>Bandan
>>    
>>
>
>  
>
copy on write links are a perennial "everyone would like them but nobody
ever actually codes them" feature.

