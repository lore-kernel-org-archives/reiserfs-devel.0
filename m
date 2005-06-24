From: David Masover <ninja@slaphack.com>
Subject: reiser4/VFS plugins
Date: Thu, 23 Jun 2005 22:26:45 -0500
Message-ID: <42BB7D75.2010304@slaphack.com>
References: <20050620235458.5b437274.akpm@osdl.org>	 <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com>	 <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com>	 <42B8BB5E.8090008@pobox.com> <42B8E834.5030809@slaphack.com>	 <42B8F4BC.5060100@pobox.com>  <42BA4F7E.6000402@namesys.com> <1119546015.17063.14.camel@localhost.localdomain> <42BB60AA.1060606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB60AA.1060606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ok, how long will it actually take to implement the suggested changes?

And, can we maintain both versions, VFS and internal?

It might be a good idea to be able to present both versions at once and
let the benevolent dictators take their pick.  They didn't like it when
we changed some VFS things and were trying to merge, and they don't like
it now when we duplicate some VFS things and try to merge.  It seems
they just don't want it merged.

So, we can give them the choice, very bluntly and simply, with code to
back it up.  "Choose this patchset or this one, or tell us what you
really want changed."

(Please excuse the "we" pronoun.  I can't say I've been helping much.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQrt9dHgHNmZLgCUhAQL9vQ/9GUvW5qw+5mJUniMly+IpCXbEur8CvPU0
1B+cIulUjMPX6JHQ9DA4o1tCRPp0rE8423jXpmIfFsEJ5hs7coOEaRTctxNI67pz
wzG4N8HVY8h6obvLXqYPU1u93unWRi1bzriGKGCi/hlMCdFss8J19O6aPtKlQq/p
HB1Q4zMhr+nHbI7iMjJk3K0ZwQwA7UjG3bwnaJNl7CNUcnTsoyb+qVuALUJgIdtK
262OWUzOdrLF00zkQdy1rzoBya5LJsZ+Wn2f1Jzbq0Jsc1dDYjs0Tr9aOrgLNTqZ
S7W5rIPJm5uKYWQZppxuLMKDGr7/sPki3If8OSJUa2g+0uRnpyACsnsejSYfCiYi
1k1pp04i9WtVssdYbEzLxYrJE+1edk34X0SfSf2i/kNTZkr71yx9R2V8S0yuXCJ4
V2UEY4Se+kLDxHphWlrOqP3SE/9AjAU/tzxeBdOLZr/z329F9Yljh2IpzJTInOux
PmPzhZfxLL6yVG9O5FhCfPhIVDqlOFi5KyrE1apgVIdwr9rS3xZOWkGepX4qyvC6
b+LKfbOoz/X2hheXsmLMu4txXd+5lRs1DEDBGUVYAoWJ98SSE7SGGAVoch0F7O9s
+S1KFke9a9JS4Nd0YQNyTbZ1/nlTnDuWXF/P3sOUJONxNXAQYliwJwYTZobSf22y
Fsf375GHEPI=
=d7sL
-----END PGP SIGNATURE-----
