From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [PATCH] reiserfs: Fix corruption during shrinking of xattrs
Date: Wed, 14 Apr 2010 01:32:37 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1004140127090.29272@bogon.housecafe.de>
References: <4BC4C888.9040104@suse.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463809526-313401583-1271233957=:29272"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BC4C888.9040104@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>, stable@kernel.org, kernel@jbeekman.nl, gregsurbey@hotmail.com, Marco Gatti <marco.gatti@gmail.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463809526-313401583-1271233957=:29272
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 13 Apr 2010 at 15:39, Jeff Mahoney wrote:
>  This patch fixes it to use new_size.

Tested-by: Christian Kujau <lists@nerdbynature.de>

With this patch applied (to today's mainline git, 2.6.34-rc4) I was able 
to create 30k files with xattrs on the same test system that was failing 
to do so before.

Thanks for the fix!

Christian.
-- 
BOFH excuse #88:

Boss' kid fucked up the machine
---1463809526-313401583-1271233957=:29272
Content-Type: TEXT/x-diff; name=reiserfs-xattr_rc4.diff
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.01.1004140132370.29272@bogon.housecafe.de>
Content-Description: 
Content-Disposition: attachment; filename=reiserfs-xattr_rc4.diff

ZGlmZiAtLWdpdCBhL2ZzL3JlaXNlcmZzL3hhdHRyLmMgYi9mcy9yZWlzZXJm
cy94YXR0ci5jDQppbmRleCA0Zjk1ODZiLi4yMDU4YzI4IDEwMDY0NA0KLS0t
IGEvZnMvcmVpc2VyZnMveGF0dHIuYw0KKysrIGIvZnMvcmVpc2VyZnMveGF0
dHIuYw0KQEAgLTU1NCw3ICs1NTQsNyBAQCByZWlzZXJmc194YXR0cl9zZXRf
aGFuZGxlKHN0cnVjdCByZWlzZXJmc190cmFuc2FjdGlvbl9oYW5kbGUgKnRo
LA0KIAlpZiAoIWVyciAmJiBuZXdfc2l6ZSA8IGlfc2l6ZV9yZWFkKGRlbnRy
eS0+ZF9pbm9kZSkpIHsNCiAJCXN0cnVjdCBpYXR0ciBuZXdhdHRycyA9IHsN
CiAJCQkuaWFfY3RpbWUgPSBjdXJyZW50X2ZzX3RpbWUoaW5vZGUtPmlfc2Ip
LA0KLQkJCS5pYV9zaXplID0gYnVmZmVyX3NpemUsDQorCQkJLmlhX3NpemUg
PSBuZXdfc2l6ZSwNCiAJCQkuaWFfdmFsaWQgPSBBVFRSX1NJWkUgfCBBVFRS
X0NUSU1FLA0KIAkJfTsNCiANCg==

---1463809526-313401583-1271233957=:29272--
