From: "Nate Diller" <nate.diller@gmail.com>
Subject: Re: Viewing files as directories
Date: Tue, 25 Jul 2006 09:22:01 -0700
Message-ID: <5c49b0ed0607250922w60f217dap468d2356129479ac@mail.gmail.com>
References: <44C5D5E4.2010209@namesys.com>
	 <20060725133522.68964.qmail@web51314.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29195-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060725133522.68964.qmail@web51314.mail.yahoo.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: tdwebste2@yahoo.com
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On 7/25/06, Timothy Webster <tdwebste2@yahoo.com> wrote:
> WARNING, a users point of view ;)
> Everything is a file, including a directory.
>
> Being able to view files as directories is not just a
> nice to have thing. It is actually required if we are
> going to manage changesets of odf files.
>
> Changesets are wonderfultool we have as developers to
> assist as a community to develop huge complex code.
> The truth is most people aren't code developers, but
> document developers. odf files are a container. And it
> is handy for users to see them as just a single file.
> But just about just about every program or script
> would be better off seening the odf as a compressed
> directory.
>
> Yes it would be really wonderful, if we could just see
> directories as file and files as directories. Which of
> course means a file and a directory are one in the
> same.
>
> As things stand now the way forward seams to be per
> application program mime types. Simple right, but it
> is not because, applications tools like svn, brz,
> darcs, etc. Can't understand that directory checked is
> just a odf file. For the basic rule of a file is a
> directory and a directory is a file to be true.
> Directories need to have mime types too.
>
> ===========================
> My question
> ===========================
> How should directory mime types be recorded?
> What is the standard?

there's no standard for this sort of thing, but the Be file system did
this, maybe it's the 'standard' cause no one else has really even
tried.  either way, the book about it is *very* worthwhile, and these
days is free

http://haiku-os.org/downloads.php?mode=view_dl&id=7

NATE
