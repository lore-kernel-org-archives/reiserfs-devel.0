From: KELEMEN Peter <Peter.Kelemen@cern.ch>
Subject: Re: File System shootout...
Date: Wed, 8 Oct 2003 11:36:02 +0200
Message-ID: <20031008093602.GC10070@chihiro.cern.ch>
References: <1065566743.25882.99.camel@mikeb.staff.netnation.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1065566743.25882.99.camel@mikeb.staff.netnation.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

* Mike Benoit (mikeb@netnation.com) [20031007 15:45]:

> http://fsbench.netnation.com/

Nice pages, but please repeat measurements with file sizes at
least 16x larger than physical memory to eliminate caching
effects.  Also, since you're obviously processing the results,
percentage relative to best (or worst) performance would help
comparison.

Peter

--=20
    .+'''+.         .+'''+.         .+'''+.         .+'''+.         .+''
 Kelemen P=E9ter     /       \       /       \     Peter.Kelemen@cern.ch
.+'         `+...+'         `+...+'         `+...+'         `+...+'
