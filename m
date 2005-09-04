From: Hans Reiser <reiser@namesys.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Sat, 03 Sep 2005 17:15:02 -0700
Message-ID: <431A3C86.5010409@namesys.com>
References: <20050901134604.31ddd297@SiRiUS.home> <20050901144842.34629bcf@SiRiUS.home> <4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com> <43171D57.3030007@namesys.com> <20050903100846.GC3405@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050903100846.GC3405@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: Peter Staubach <staubach@redhat.com>, vs@namesys.com, reiserfs-list@namesys.com

Sander wrote:

>Hans Reiser wrote (ao):
>  
>
>>Research for filesystems generally says that as you get more than 85%
>>full the performance goes down, by a lot as you get close to 100%.  5%
>>is probably too little rather than too much.
>>    
>>
>
>Does this mean that if my reiser4 filesystem is 90% full, it can be
>considered 85% full wrt performance because of the 5% reservation?
>
>	Sander
>
>  
>
yes, approximately.
