From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.6.13 + reiser4 = scheduling while atomic
Date: Mon, 03 Oct 2005 11:24:51 -0700
Message-ID: <43417773.8000309@namesys.com>
References: <623652d50510021049l66c481d4v@mail.gmail.com>	 <43403560.2060807@mid.email-server.info>	 <5d8b7b90510021502x67f006e4xc0465c948a8abea8@mail.gmail.com> <623652d50510030235h3fcaab10x@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26388-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <623652d50510030235h3fcaab10x@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Bainbridge <chris.bainbridge@gmail.com>, vs <vs@thebsh.namesys.com>
Cc: reiserfs-list@namesys.com

Chris Bainbridge wrote:

>On 02/10/05, Islam Amer <pharon@gmail.com> wrote:
>  
>
>>On 10/2/05, Alexander Skwar <listen@alexander.skwar.name> wrote:
>>    
>>
>>>Chris Bainbridge schrieb:
>>>      
>>>
>>>>Hi,
>>>>
>>>>Today I updated from vanilla 2.6.12.5 + reiser4 to vanilla 2.6.13 +
>>>>reiser4-for-2.6.13-1.patch + spin_macros patch from this list.
>>>>        
>>>>
>
>The errors went away with CONFIG_PREEMPT_NONE. CONFIG_PREEMPT seems to
>be the problem.
>
>
>  
>
Thanks, can we make our config dependent on !CONFIG_PREEMPT and send it
in Vladimir?
