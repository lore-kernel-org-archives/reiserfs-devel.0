From: Oleg Drokin <green@namesys.com>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 9 Oct 2002 18:31:41 +0400
Message-ID: <20021009183141.A4778@namesys.com>
References: <20021009094215.B11954@namesys.com> <200210091602.34904.Dieter.Nuetzel@hamburg.de> <20021009180935.A4618@namesys.com> <200210091620.15077.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200210091620.15077.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Wed, Oct 09, 2002 at 04:20:15PM +0200, Dieter N?tzel wrote:
> > What's "it"? Is it means what I describe, or "it" means wrong stuff in the
> > middle of files?
> Wrong stuff in the middle (appended) _AND_ sometimes whole broken files (if 
> the files are smaller).

If the damaged part is still within appended datam, it is still possible that
not all of data happened to flush.

> > It only confirms my version, note how whole block of zeroes
> > was inserted after emergency sync (perhaps during crash).
> "whole block of zeroes" would be fine but it isn't sometimes...
> Sometimes it is stuff from other (deleted?) files.

Well, it depend on what was in newly allocated blocks, it might be zeroes for
empty blocks or some deleted data for previously used blocks.

> When I get the "next" crash during kernel compilation I "save" some files for 
> you.

Hm. This is not necessary, I know what's happening in your case it seems.

Bye,
    Oleg
