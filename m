From: Hans Reiser <reiser@namesys.com>
Subject: Re: Will Reiser4 support a "hidden" attribute?
Date: Wed, 19 Nov 2003 23:03:16 -0800
Message-ID: <3FBC6734.4070104@namesys.com>
References: <20031120005844.GC8854@Benine>	<1069305523.11497.37.camel@faith>	<20031120142353.GA1253@Benine>	<3FBC6050.3050600@namesys.com> <16317.3267.987713.833145@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16317.3267.987713.833145@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Guido Schimmels <guido.schimmels@freenet.de>, reiserfs-list@namesys.com

I respectfully disagree, and I expect us to keep to the plan I 
outlined.  Mr. Demidov, put this on your list of tasks to complete.

Guido, I am sorry to say that this will probably get added after we 
submit a reiser4 with fully debugged traditional functionality to Linus, 
which means sometime next year if I don't go broke in January.

Hans

Nikita Danilov wrote:

>Hans Reiser writes:
> > Nikita, please update us all on how far we have gotten in implementing this.
>
>OK.
>
>We currently don't have ability to hide particular file. That is, there
>is no way to somehow mark file hidden at the kernel level. If I am
>allowed to humbly voice my opinion, usages shown by participants of this
>thread (trimming down list of files visible in the GUI front-end) should
>be done at the user level. In UNIX ls(1) command hides dot files for
>ages.
>
>On the other hand, some file system objects (pseudo files
>http://namesys.com/v4/pseudo.html) are not shown by the readdir(2). But
>this is to keep various utilities like cp(1) and friends from trying to
>read from them.
>
> > 
> > -- 
> > Hans
> > 
> > 
>
>Nikita.
>
>
>  
>


-- 
Hans


