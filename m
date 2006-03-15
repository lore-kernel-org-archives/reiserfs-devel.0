From: Edward Shishkin <edward@namesys.com>
Subject: Re: Permission denied while accessing pseudos
Date: Wed, 15 Mar 2006 22:51:31 +0300
Message-ID: <44187043.6010507@namesys.com>
References: <200603151453.10697.fred@uh.cu> <44186532.2070305@namesys.com> <200603151536.58783.fred@uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603151536.58783.fred@uh.cu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yoanis Gil Delgado <fred@uh.cu>
Cc: reiserfs-list@namesys.com

Yoanis Gil Delgado wrote:

>On Wednesday 15 March 2006 14:04, you wrote:
>  
>
>>Yoanis Gil Delgado wrote:
>>    
>>
>>>Hi there. I've been playing around with pseudos and whenever i try to
>>>access a pseudo dir or file i get a Permission denied error. For example:
>>>	$ ls hello.txt/..../rwx
>>>	Permission denied
>>>I also tried
>>>	$ ls hello.txt/..plugins/rwx
>>>	 Permission denied
>>>I also tried to list a missing plugin and i get the same error. For
>>>example $ ls hello.txt/..../pepito
>>>	Permission denied
>>>
>>>Thanks.........
>>>      
>>>
>>Hello.
>>What patch do you use to enable pseudo?
>>    
>>
>I use, reiser4-2.6.15-enable-metas.diff available at the namesys ftp.
>
>  
>

In order to access pseudos of a regular file, the last one should have 
executable permission.
Set it by chmod (1) and try again.

Thanks,
Edward.
