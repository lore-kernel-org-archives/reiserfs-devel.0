From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Wed, 14 Apr 2004 10:12:57 -0500
Message-ID: <407D54F9.3020704@pobox.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com> <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com> <407C279A.3060303@namesys.com> <407C3004.3070401@pobox.com> <407C316B.80606@namesys.com> <407C35B0.3080109@pobox.com> <407CA700.9070403@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17940-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407CA700.9070403@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

David,

I think you might be onto something, but doing this manually for each 
file isn't viable (in my opinion).

What I think might work is applying symlinks to all files hierarchically 
so that all "*/nsa/*" names resolve to "*/nsa.gov/security/*".

Can you explain more how views would contribute to this? I've read the 
proposal but don't yet see how they would work in practice.

Thanks for the reply.

John


David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> John D. Heintz wrote:
> | Hans Reiser wrote:
> |
> |> John D. Heintz wrote:
> |>
> |>>
> |>> Does some sort of syntactic shorthand actually break the set
> |>> theoretic naming system rules?  Or is this just something you view as
> |>> needless complexity?
> |>
> |>
> |>
> |> precisely what syntactic shorthand?
> |
> |
> |
> |
> | foo/nsa:permissions -> foo/nsa.gov/secure-linux/permissions
> |
> | This assumes a mapping from "nsa" -> "nsa.gov/security/".
> |
> | The characters up to the ':' would be looked up in a namespaces map, and
> | if found the substituion would occur before further name-> object
> | resolution. I don't think this breaks the goals set out in the "Future
> | Vision" white paper, but I guess that is exactly what I am asking you ;-)
> 
> Since we are allowed "views", how about this:  make foo/nsa a symlink to
> foo/nsa.gov.  Or, alternatively, make foo/nsa/permissions a symlink to
> foo/nsa.gov/secure-linux/permissions.  These symlinks would only exist
> for either the process (and its children) which established them, or for
> all children of the file with that linkfarm, I'm not sure which.
> 
> In the first example, you'd do something like this:
> 
> ln -s /..some.pseudo.file/nsa.gov/secure-linux/permissions \
> /..some.pseudo.file/nsa/permissions
> (hoping it handles directory creation here)
> 
> The problem here is only children of 'ls' are affected, meaning shell
> scripts don't work unless shells are modified, which is why I like this
> better:
> 
> ln -s foo/nsa.gov/secure-linux/permissions foo/nsa/permissions
> 
> now we have
> 
> foo/nsa/permissions -> foo/nsa.gov/secure-linux/permissions
> 
> but now, if foo is a directory, we also have
> 
> foo/bar/nsa/permissions -> foo/bar/nsa.gov/secure-linux/permissions
> 
> The only thing here is, if foo is a directory, we probably want to hide
> the whole construct somehow anyway.  I'll leave that to others -- I
> joined this discussion a little too late to _really_ know what I'm
> talking about.
> 
> Either way, some sort of shortcut (and I'm suggesting symlinks to keep
> it Unix) controlled from user-space keeps the main advantage of XML
> namespaces -- you can have much more than just "nsa.gov/secure-linux",
> but any arbitrary length you want, and users handle the namespace
> collisions for you (that would result from creating something like
> foo/permissions)
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
> 
> iQIVAwUBQHynAHgHNmZLgCUhAQI+Aw/8Cb8ocN1T/M5SUGi8Qd/nqimmxnSpFryh
> QDOPTvlnqfco2kaQUagmhMAKS8xTqrGmQgIHJ/UZDAAW+fyhDgketYEd+KTiNZ5N
> Ccod3/Yk1JuW81UvSTcvcRwbqq71UVXbldo5URWZfRYi5diUhEriphtKDlDRSG7V
> 7Dicm2LwmhZq6je8wr/AZ0ywRBLjU+28oeSmiJXFe4xKxVftrH532RXg26e72aYZ
> c4f3zblv2+c6kDtGjf6XL0ABTM7RkD0MHCxEcq0FcXz0wp75cQtlL8n31eoiD7at
> SRLBeq2lp8h/lLxhcl67X+zQ/PgC4p/3ZrKLZ341beiHkL2rj4RjZFt9lf751Hfz
> xA3SSE7h6abg6VyJEilpvb9SNKTMGULC1MBXKwibHaDXgHo62pdMSrcz9Cw+ihaz
> zyENAUW0V3OWL5YSIPpl0BFy7XPnSuaE2Z3+N3Nej34fWmrh+HzHErRk0foqlmhu
> vmQ8Q4bbaakoe/uJDeMu2XTpoNChe7b6vxOwYxB9mxh4T2VOnli9YhpQm1ky7U1f
> BQTfIYok5+Az17O8tvlGC09DUfIslqLtpHVh9IyXOOfem6EEMIB/EJA3qv2us+IY
> si4M7TbeYVGaVLN+DACKL7gr5BKH0QWRRD+WFrn7Vig8IZSWrTGCEiTR8AWfpVR4
> J8fcsxM53Cc=
> =XGmI
> -----END PGP SIGNATURE-----
> 
> 

