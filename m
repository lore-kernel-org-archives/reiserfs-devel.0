From: Hans Reiser <reiser@namesys.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Mon, 12 Apr 2004 11:15:27 -0700
Message-ID: <407ADCBF.8000609@namesys.com>
References: <407AB9AE.3060801@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407AB9AE.3060801@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "John D. Heintz" <jheintz@pobox.com>
Cc: reiserfs-list@namesys.com

Mhy colon instead of / ?

There is no reason for it.  Implementing a storage layer to make XML 
storage more efficient might be commercially interesting, but XML is not 
what we should copy for namespace style.

Hans

John D. Heintz wrote:

> Hi all,
>
> I work with XML quite a lot in my job and deal with XML namespaces 
> often. While I think they have some problems in the XML world (poor 
> integration with XML InfoSet) they might be useful for Reiser4 and 
> they seem to play well with the Set Theoretic underlying models (as 
> far as I can tell :).
>
> Here's what I'm thinking:
> Instead of `cat foo.txt/metas/uid`
> it would be `cat foo.txt/reiser4:metas/uid` or perhaps `cat 
> foo.txt/reiser4:uid`.
>
> Here the "reiser4" shorthand would map to "http://www.namesys.com/v4" 
> or whatever Hans and team decided.
>
> The reiser4 namespace could be hardcoded or compiled in  and exposed 
> via `cat /proc/fs/reiser4/namespace`.
>
> Other namespaces could be added to files/directories and I'd assume 
> something like:
> `cat foo.txt/reiser4:namespaces` would list all the namespaces 
> available for a particular file.
> Something like:
> reiser4    http://www.namesys.com/v4
> streams   http://www.evil-empire.com/streams
> snapcm   http://www.snapcm.com/snapcm
>
> John D. Heintz
>
> ps - SnapCM is the name of a versioned linking model that I developed 
> some time ago and hope one day to build a plugin for Reiser4. I'm 
> being optimistic listing it in the available namespaces. ;-)
>
>


-- 
Hans

