From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Wed, 29 Jun 2005 21:48:08 -0700
Message-ID: <42C37988.2020605@namesys.com>
References: <hubert@uhoreg.ca>	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>	<8783be6605062914341bcff7cb@mail.gmail.com>	<42C3615A.9020600@namesys.com> <871x6kv4zd.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <871x6kv4zd.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Hubert Chan wrote:

>On Wed, 29 Jun 2005 20:04:58 -0700, Hans Reiser <reiser@namesys.com> said:
>
>  
>
>>Ross Biro wrote:
>>    
>>
>>>How is directories as files logically any different than putting all
>>>data into .data files and making all files directories (yes you would
>>>need some sort of special handling for files that were really called
>>>.data).
>>>      
>>>
>
>  
>
>>Add to this that you make .data the default if the file within the
>>directory is not specified,
>>    
>>
>
>It's sort of like the way web servers handle index.html, for those who
>think it's a stupid idea.  (Of course, some people may still think it's
>a stupid idea... ;-) )
>
>  
>
Good analogy.

>>and define a stanadard set of names for metafiles, and you've got the
>>essential idea, and any differences are details.
>>    
>>
>
>  
>

