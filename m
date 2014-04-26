From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Sat, 26 Apr 2014 11:14:00 -0400
Message-ID: <535BCD38.5070607@suse.com>
References: <20140423140033.704113918@suse.com> <a97220c3691f4bfc6e57283827b68524@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a97220c3691f4bfc6e57283827b68524@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 4/25/14, 11:46 PM, doiggl@velocitynet.com.au wrote:
> Hello Jeff, Could you update the source in obs as well. openSUSE
> Build Service > Projects > filesystems > reiserfs 
> https://build.opensuse.org/package/show/filesystems/reiserfs
> 
> logged https://bugzilla.novell.com/show_bug.cgi?id=875332

Hi Glenn -

This patch set is against the kernel, not reiserfsprogs. Also, since
there's no functional changes introduced in the patchset (except for
the workqueue changes), there's no sense in carrying them separately.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)

iQIcBAEBAgAGBQJTW804AAoJEB57S2MheeWyvS0P/A56ymCg2kIzCgtzdY54/mLE
JTZLjZJ6ZDB19FJ+UXWvHkQqbsz+1P1/zGCjhGukBlOe8/3DpKi8IEL3xIxh846k
822OuRfNGKhI0EBitiEDVruNKHbN+K+8Ui/yp6K+3/A882/SspsW0jEFtM9V4QAc
2AIXEMRI5GXSAm6d/nf76MeyxUmJMZUHnLAwaQ8vrPmuFTAZCEM8edOYWHkRI8Jh
oVRNQkJeooNXxUiFYtWzaF9VPHJzPf+vHkTXRcrSjBk7p2P3V8aAEqG9gX+A6X13
1tMpDyDBGzjqSJDXMHTo0OueZpkGZ7WKAfY1ZXg+YlNUH0LJJWBlzaUpSauumho/
/IeLIB2w+8Bx8WQOo3wxQRz0McMtn+tD+8OQ+X2MSdXj/k5VJKbDodxntB2zwKes
VsoZMvVAhgoF9vteVEYFOSfrTEf714W6GQpa8XWKDc8wRd0ZY/n3/ZAhocpjnj2A
SAIBvXJ8YEifcAWPswLx4J6DSzKj+oIhwX5aNxxQDSpzms13qapUCxNR439fkHKH
gKQK7+RIeSjQ/TQoOc80xO9auPmanB0CVBqBgJhe46oo4xyMDEQGEFflNDK0ZifR
sBljbH8NdOmGCZpbPE6qiOD5rNvUQZagAsd3OD5uRhSlLGrupr+mn9Bflss5EwSm
95aqhs5mbOSNR6LPxB2k
=Bwqc
-----END PGP SIGNATURE-----
