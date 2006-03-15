From: Hans Reiser <reiser@namesys.com>
Subject: Re: State of the Reiser4 FS
Date: Wed, 15 Mar 2006 12:43:57 -0800
Message-ID: <44187C8D.5050105@namesys.com>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com>	 <1142336718.7415.55.camel@tribesman.namesys.com>	 <194f62550603140732j6ef10757j@mail.gmail.com>	 <4417BEC4.6060506@namesys.com> <1142451941.16641.32.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1142451941.16641.32.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: reiserfs-list@namesys.com

Jonathan Briggs wrote:

>On Tue, 2006-03-14 at 23:14 -0800, Hans Reiser wrote:
>[snip]
>  
>
>>They claim that if we don't use the ext3 code
>>in our fs then they will be forced to shoulder an extra burden to
>>maintain our code.  We are not allowed to specify that they should not
>>maintain our code at all.  I need to read more Kafka I think, it is hard
>>for me to understand it all.
>>    
>>
>
>Err, this actually does make a lot of sense Hans.
>
>The mainline Linux Kernel code is maintained by everyone that can
>convince Linus or a sub-maintainer to accept their patch.  In order to
>  
>
I am the reiserfs/reiser4 sub-maintainer.  So, if reiser4 works well,
and is faster than any other Linux FS, and it is,  maintaining it over
time is for me to worry about, not them. 
