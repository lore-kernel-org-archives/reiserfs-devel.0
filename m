From: "David Dabbs" <david@dabbs.net>
Subject: RE: Fibration questions
Date: Fri, 16 Jul 2004 12:45:21 -0500
Message-ID: <20040716174402.DC7AD15CD3@mail03.powweb.com>
References: <16631.46673.26333.276372@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16631.46673.26333.276372@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Nikita Danilov' <Nikita@Clusterfs.COM>
Cc: reiserfs-list@namesys.com


> Nikita Danilov wrote:
> 
> Well, what would this achieve (besides code obfuscation)? I highly
> doubt that one can present a work-load where fibration calls will be
> CPU bottlenecks. Premature optimization is a root of all evil, as they
> say.
>

Yeah, you're right Prof Knuth. :) I thought better of that after I sent it. 

 
> 
> The whole point of having plugin infrastructure is that one is able to
> play with new file system policies easily. Just try it!
> 

I'll do that. Recalling your kerneltrap post, I figured that if it was
desirable to separate the .o files from the sources that it would be good to
keep c & h together. However, if you or another r4 developer said, 'we
profiled this and it is of marginal benefit,' then why bother?


>  > Using the fibre for fast extension testing
>  > A common filesystem client query is for '*.xxx'. If there were (is?) an
>  > alternate readdir[64]() interface that allowed the caller to pass an
>  > 'extension mask/filter,' then the fibre could be leveraged to quickly
> test
>  > whether a given file matches the mask without calling unpack_string(),
> etc.
>  > Kind of like saying to the filesystem:
>  >
>  > 	SELECT filename WHERE dir = '/home' AND filename LIKE '%.xxx'
> 
> There is no such system call (there are user-level functions with the
> similar functionality, fts(3), and scandir(3)).
> 
> sys_reiser4() system call is targeted to similar data-base like kind
> of access paths.
> 

I saw something about the syscall syntax somewhere, perhaps in the parser
code. Should go back and investigate further. Any pointers to the most
up-to-date docs would be appreciated.


Thanks Nikita.

David





