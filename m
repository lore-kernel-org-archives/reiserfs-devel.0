From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Thu, 15 Apr 2004 10:15:27 -0500
Message-ID: <407EA70F.6010301@pobox.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com> <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com> <407C279A.3060303@namesys.com> <407C3004.3070401@pobox.com> <407C316B.80606@namesys.com> <407C35B0.3080109@pobox.com> <407CA700.9070403@slaphack.com> <407D54F9.3020704@pobox.com> <407DD71D.30902@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407DD71D.30902@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> John D. Heintz wrote:
> | David,
> |
> | I think you might be onto something, but doing this manually for each
> | file isn't viable (in my opinion).
> 
> It applies recursively.  Let's assume for a moment that /..foo is a
> directory containing pseudo-files, metadata, or whatever the current
> term is, for the file '/'.  By creating the file /..foo/something as a
> symlink to /..foo/<some long path>/something, you automatically create
> /bar/..foo/something, which is a link to /bar/..foo/<same long
> path>/something.
> 
> | What I think might work is applying symlinks to all files hierarchically
> | so that all "*/nsa/*" names resolve to "*/nsa.gov/security/*".
> 
> Just what I described above, only it is local to the tree I apply it to,
> and files deeper in the hierarchy take precedence.  So, for example, if
> I create a link manually for /bar/..foo/something that points somewhere
> else, then /bar and all subdirs (and subfiles) of /bar contain that same
> link, instead of the one created for /.
> 

Thanks for the explanation and I like the idea. Being able to define a 
symlink and have it recursively apply might be exactly what is needed here.

Is this behavior currently part of Reiser4? I don't remember seeing it 
anywhere, but I do remember reading something about inheritence being 
needed for various features. Is this the same as inheritence?

Thanks,
John Heintz
