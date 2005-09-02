From: Hans Reiser <reiser@namesys.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Fri, 02 Sep 2005 00:19:55 -0700
Message-ID: <4317FD1B.504@namesys.com>
References: <20050901134604.31ddd297@SiRiUS.home>	 <20050901144842.34629bcf@SiRiUS.home> <4316F9CC.2090904@namesys.com>	 <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com>	 <43171D57.3030007@namesys.com> <431726F2.1090508@redhat.com> <b14e81f005090119283406eafa@mail.gmail.com> <4317F28F.80704@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4317F28F.80704@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: michael chang <thenewme91@gmail.com>, Peter Staubach <staubach@redhat.com>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:

>Hello
>
>michael chang wrote:
>  
>
>>On 9/1/05, Peter Staubach <staubach@redhat.com> wrote:
>>    
>>
>>>Hans Reiser wrote:
>>>
>>>      
>>>
>>>>Research for filesystems generally says that as you get more than 85%
>>>>full the performance goes down, by a lot as you get close to 100%.  5%
>>>>is probably too little rather than too much.
>>>>
>>>>        
>>>>
>>>Wow.  What is all that space used for? 
>>>      
>>>
>
>Reiser4 allocates log records dynamically. So it has to allocate some disk space even when it is about to remove a file.
>Reserved space is used when allocation is required to preform removal operation.
>This allows to avoid returning ENOSPC on operations which are usually used to free disk space.
>  
>
It could probably be a lot less than 5%, 2% is more than enough I would
guess, but we also need to reserve space to get good performance.
