From: Hans Reiser <reiser@namesys.com>
Subject: Re: how do plugins work?
Date: Fri, 25 Oct 2002 03:25:32 +0400
Message-ID: <3DB8816C.10400@namesys.com>
References: <Pine.LNX.4.33.0210241624300.2792-100000@mitte.informatik.hu-berlin.de> <3DB81095.25F0C662@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: gregor@zeitlinger.de, reiserfs mailing list <reiserfs-list@namesys.com>

Edward Shishkin wrote:

>Gregor Zeitlinger wrote:
>  
>
>>Hi,
>>
>>I'm new to this list. I'm wondering how the file plugins work. Are they
>>just a means of accessing the file contents or are they also designed to
>>save the file differently.
>>
>>For example, could you create a plugin that automatically zips each
>>text/plain file, which is totally transparent to the user?
>>    
>>
>
>Yeah, we could. Although transparentness means a bit worse compression..
>
?

You mean because of choosing to use compression atoms that are node 
sized?  Maybe it might be more precise to say that efficient random 
access motivates small compression atoms which are less efficient? 
 (Assuming that I understood you.)

