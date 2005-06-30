From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Wed, 29 Jun 2005 20:04:58 -0700
Message-ID: <42C3615A.9020600@namesys.com>
References: <hubert@uhoreg.ca>	 <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>	 <87hdfgvqvl.fsf@evinrude.uhoreg.ca> <8783be6605062914341bcff7cb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24823-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <8783be6605062914341bcff7cb@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ross Biro <ross.biro@gmail.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Ross Biro wrote:

>On 6/29/05, Hubert Chan <hubert@uhoreg.ca> wrote:
>  
>
>>On Wed, 29 Jun 2005 01:09:05 -0400, Horst von Brand <vonbrand@inf.utfsm.cl> said:
>>
>>    
>>
>>>Hubert Chan <hubert@uhoreg.ca> wrote: [...]
>>>And doing "tar cf /dev/tape /usr/games/tetris" gives you a nice tangle
>>>of undecipherable junk.
>>>      
>>>
>
>I'm confused.  Can someone on one of these lists enlighten me?
>
>How is directories as files logically any different than putting all
>data into .data files and making all files directories (yes you would
>need some sort of special handling for files that were really called
>.data). 
>
Add to this that you make .data the default if the file within the
directory is not specified, and define a stanadard set of names for
metafiles, and you've got the essential idea, and any differences are
details.

> Then it's just a matter of deciding what happens when you
>call open and stat on one of these files?
>
>For backwards compatibility, current existing system calls have to
>treat these things as directories.  Perhaps an exception could be made
>for exec.
>
>But we could have a whole new set of system calls that treat things as
>magic, and if files as directories is as cool as many people think,
>apps will start using the new api.  If not, they won't and the new api
>can be deprecated.
>
>    Ross
>
>
>  
>

