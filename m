From: "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: Making a test version of Bullseye as a GCE image available?
Date: Thu, 25 Mar 2021 10:49:58 -0400
Message-ID: <YFyjFt/lmE6ECGcS@mit.edu>
References: <YFjZS8DsVQQeE5Ov@mit.edu>
 <3502816731a314939e4dc04edd5c1ce2744bda11.camel@metztli.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-cloud=gldc-debian-cloud=m.gmane-mx.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <3502816731a314939e4dc04edd5c1ce2744bda11.camel@metztli.com>
Resent-Message-ID: <qI_lg-26l_M.A.-ZF.qMKXgB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-cloud/>
List-Post: <mailto:debian-cloud@lists.debian.org>
List-Help: <mailto:debian-cloud-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-cloud-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-cloud-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/YFyjFt/lmE6ECGcS@mit.edu
Content-Type: text/plain; charset="iso-8859-1"
To: Metztli Information Technology <jose.r.r@metztli.com>
Cc: debian-cloud@lists.debian.org, Edward Shishkin <edward.shishkin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Wed, Mar 24, 2021 at 10:38:33PM -0700, Metztli Information Technology wr=
ote:
> Note, however, that when I built reiser4 SFRN 4 -enabled 5.10.23 kernel
> for Debian 11 Bullseye a few days ago, I had to use the guest
> environment for Debian 10 Buster since there was not even a repo for
> bullseye=A0
> <=A0https://github.com/GoogleCloudPlatform/compute-image-packages > to
> include in /etc/apt/sources.list.d/google-cloud.list

I just checked, and while the documentation in:

   https://github.com/GoogleCloudPlatform/compute-image-packages

hasn't been updated to include Bullseye, but if you follow the pattern
given:

   Add a source list file /etc/apt/sources.list.d/google-cloud.list and
   change DIST to either stretch for Debian 9 or buster for Debian 10:

   DIST=3Dstretch
   sudo tee /etc/apt/sources.list.d/google-cloud.list << EOM
   deb http://packages.cloud.google.com/apt google-compute-engine-${DIST}-s=
table main
   deb http://packages.cloud.google.com/apt google-cloud-packages-archive-k=
eyring-${DIST} main
   EOM

And you use "bullseye" for DIST, it appears, that if you look at:

https://packages.cloud.google.com/apt/dists/...

the relevant subdirectories (e.g.,
google-compute-engine-bullseye-stable) do exist and appear to be
populated.

I haven't tried them using them, so I don't know how well they work,
but it looks like they do exist and are ready for people to test them
out and report issues.  (Insert standard caveat of using Debian
Testing in production environments, of course.  If it breaks, you get
to keep both pieces.  :-)

Cheers,

						- Ted

