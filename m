From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Viewing files as directories
Date: Tue, 25 Jul 2006 21:25:17 -0400 EDT
Message-ID: <5822151589-BeMail@DualP3>
References: <5c49b0ed0607250922w60f217dap468d2356129479ac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29208-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5c49b0ed0607250922w60f217dap468d2356129479ac@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nate Diller <nate.diller@gmail.com>
Cc: reiserfs-list@namesys.com, tdwebste2@yahoo.com

Nate Diller wrote on Tue, 25 Jul 2006 09:22:01 -0700:
> On 7/25/06, Timothy Webster <tdwebste2@yahoo.com> wrote:
> > ===========================
> > My question
> > ===========================
> > How should directory mime types be recorded?
> > What is the standard?
> 
> there's no standard for this sort of thing, but the Be file system did
> this, maybe it's the 'standard' cause no one else has really even
> tried.  either way, the book about it is *very* worthwhile, and these
> days is free
> 
> http://haiku-os.org/downloads.php?mode=view_dl&id=7

Apple developed their own file typing system.  It's more of a class hierarchy
than MIME types.  Have a look at "Uniform Type Identifiers", a good
description is at http://arstechnica.com/reviews/os/macosx-10.4.ars/11

Maybe there's a standard cluster of UTIs there for containers, like
directories.  By the way BeOS had directories identified with a MIME
type of application/x-vnd.Be-directory and there were other ones for
disk volumes and the like.

- Alex
