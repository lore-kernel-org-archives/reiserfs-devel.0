From: Hans Reiser <reiser@namesys.com>
Subject: Re: Two usage examples for attribute directories.
Date: Fri, 09 Dec 2005 17:46:54 -0800
Message-ID: <439A338E.3010309@namesys.com>
References: <200511201317.12598.pvh@uvic.ca> <200512021649.54939.pvh@uvic.ca>	 <43917967.4080008@st-andrews.ac.uk> <200512042027.16525.pvh@uvic.ca>	 <43983F5E.3080704@st-andrews.ac.uk>	 <87hd9jqq4d.fsf@evinrude.uhoreg.ca> <5c49b0ed0512091711y8b13c46lcbe627e28c708f95@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5c49b0ed0512091711y8b13c46lcbe627e28c708f95@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nate Diller <nate.diller@gmail.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, reiserfs-list@namesys.com

Nate Diller wrote:

> On 12/8/05, *Hubert Chan* <hubert@uhoreg.ca <mailto:hubert@uhoreg.ca>>
> wrote:
>
>     On Thu, 08 Dec 2005 14:12:46 +0000, Peter Foldiak said:
>
>     [...]
>
>     > You say "author" should be an attribute but "icon.png" is not an
>     > attribute. I am not convinced they should be treated
>     differently.  The
>     > listing doesn't look ugly to me at all (just because it is long).
>
>     IMHO, putting attributes in foo/ instead of foo/@/ increases the
>     risk of
>     collisions.  e.g. let's say I have a directory that contains a file
>     named icon.png, but I want my file manager to display its icon as some
>     other file.  If all the attributes are in foo/, then the file manager
>     will read foo/icon.png as the directory's icon, which is not what I
>     want.  It would be better if I could have a directory that contains
>     icon.png, and uses foo/@/icon.png as its icon in the file manager.
>
>
> This problem is already solved.
>
> $ ls /home/nate
> icon.png
>
> $ ls -a /home/nate
> .
> ..
> .bash_rc
> icon.png
>
> so...
>
> $ls -aa /home/nate
> .
> ..
> ..icon.png
> .bash_rc
> icon.png
>
> this works for PvH's example too:
> $ ls -aa app/
> .
> ..
> ..author
> ..category
> ..contact
> ..description
> ..name
> ..version
> .config
> .default_options
> bin
> lib
> src
> var
> Makefile
> icon.png
> install.sh
>
> NATE

yup
