From: Colin Watson <cjwatson@debian.org>
Subject: Re: Integrate fully partman-reiser4 into d-i
Date: Mon, 21 Sep 2015 12:12:10 +0100
Message-ID: <20150921111209.GA30565@riva.ucam.org>
References: <CAM12Q5QKdpHgMG_qGyhE-abO6R-uY6cKtv-5Qg36N-FTx_Z8Lw@mail.gmail.com>
 <CAM12Q5Q2GQSqE2ehj2dAmkq4ffP=x3__F76dH7KOey=vVAkQOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <bounce-debian-boot=debian-boot=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <CAM12Q5Q2GQSqE2ehj2dAmkq4ffP=x3__F76dH7KOey=vVAkQOA@mail.gmail.com>
Resent-Message-ID: <xiv8NtoAivM.A.-gB.oY-_VB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-boot/>
List-Post: <mailto:debian-boot@lists.debian.org>
List-Help: <mailto:debian-boot-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-boot-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-boot-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20150921111209.GA30565@riva.ucam.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jose R R <Jose.r.r@metztli-it.com>
Cc: debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Cyril Brulebois <kibi@debian.org>, Ben Hutchings <ben@decadent.org.uk>

On Sun, Sep 20, 2015 at 07:40:37AM -0700, Jose R R wrote:
> I have realized that although partman-reiser4 udeb enables Reiser4 to
> be listed as an option during the Debian-Installer routine of a
> netboot ISO image, the lack of support for reiser4 in GNU Parted
> (Debian's libparted) prevents installation from the GUI interface.

It should be pretty easy to add that to parted, since nowadays the only
filesystem support it has is probing support.  I suggest preparing a
patch against git://git.sv.gnu.org/parted.git master that adds the
ability to detect existing reiser4 partitions and sending it upstream;
it should only be on the order of a hundred lines.

I'd be happy to cherry-pick such a patch into the Debian packaging once
it has been committed upstream.
