From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: [2.6.19-rc2-mm1] error: too few arguments to function =?utf-8?q?=E2=80=98crypto=5Falloc=5Fhash=E2=80=99?=
Date: Tue, 17 Oct 2006 15:53:44 -0400
Message-ID: <200610171603.38253.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <20061016230645.fed53c5b.akpm@osdl.org>
Reply-To: andrew.j.wade@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20061016230645.fed53c5b.akpm@osdl.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hello,

The latest -mm introduced a new error:

  CC      fs/reiser4/plugin/crypto/digest.o
fs/reiser4/plugin/crypto/digest.c: In function =E2=80=98alloc_sha256=E2=80=
=99:
fs/reiser4/plugin/crypto/digest.c:17: error: too few arguments to function =
=E2=80=98crypto_alloc_hash=E2=80=99
make[2]: *** [fs/reiser4/plugin/crypto/digest.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

Andrew Wade
