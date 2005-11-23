From: michael chang <thenewme91@gmail.com>
Subject: Re: Reiser4 Install Guide for Ubuntu 5.10
Date: Tue, 22 Nov 2005 19:34:40 -0500
Message-ID: <b14e81f00511221634g45cd91desbcd1ecd3ebe47c75@mail.gmail.com>
References: <27c2ef000511211652o3421b4fct762dd9b12fabafd3@mail.gmail.com>
	 <1132641885.16002.24.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132641885.16002.24.camel@gentoo>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Ryan Nordman <spacerobots@gmail.com>, reiserfs-list@namesys.com, Peter van Hardenberg <pvh@pvh.ca>, Nathan Iverson <niverson@uvic.ca>, huaning <huaning@uvic.ca>, ycoady <ycoady@cs.uvic.ca>

On 11/22/05, Jake Maciejewski <maciejej@msoe.edu> wrote:
> On Mon, 2005-11-21 at 16:52 -0800, Ryan Nordman wrote:
> > Hi Hans,
> >
> > Allow me to introduce myself, I'm one of Peter (aka pvh)'s colleagues
> > here at the University of Victoria.  A while back we mentioned we'd
> > write a practical install guide for Reiser4 with Ubuntu 5.10.  Well,
> > here it is.  Let us know if you want us to make any changes to the
> > format or add/remove any steps.
> >
> > All version references in this document are up to date for Ubuntu 5.10
> > (Breezy Badger).
> >
> > Prerequisites: Add the universe repository to your sources
> >
> > 1. Install all the software needed to compile the kernel
> > # apt-get build-dep linux-source-2.6.12
> > # apt-get install linux-source-2.6.12 checkinstall libncurses-dev
> >
> > 2. Use the following commands to download the latest Reiser4 kernel
> > patch, the Reiser4 utility programs, and required libraries.
> > # wget
> > ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/reiser4-for-2.6.12-3.p=
atch.gz
> > # wget
> > ftp://ftp.namesys.com/pub/reiser4progs/reiser4progs-1.0.5.tar.gz
> > # wget ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.5.tar.gz
> >
> > 3. Install libaal
> > # tar zxf libaal-1.0.5.tar.gz
> > # cd libaal-1.0.5
> > # ./configure; make
> > # checkinstall
> > At the prompt: "Should I create a default set of package docs? [y]:"
> > type "y" and press enter.
> > You will then be prompted to input a description of the package.
> > Enter something like "locally built libaal" then press enter three
> > times.
> > # cd ..
> >
> > 4. Install reiser4progs
> > # tar zxf reiser4progs-1.0.5.tar.gz
> > # cd reiser4progs-1.0.5
> > # ./configure; make
> > # checkinstall
> > At the prompt: "Should I create a default set of package docs? [y]:"
> > type "y" and press enter.
> > At the prompt: "Do you want me to list them? [n]:" type "n" and press
> > enter.
> > At the prompt: "Should I exclude them from the package? (Saying yes is
> > a good idea) [y]:" type "y" and press enter.
> > You will then be prompted to input a description of the package.  Type
> > something like "locally built libaal" then press enter three times.
> >
> > 5. Unzip and add the reiser4 code to the linux source
> > # cd /usr/src
> > # tar xvf linux-source-2.6.12.tar.bz2
> > # cd linux-source-2.6.12/
> > # gunzip -c ~/reiser4-for-2.6.12-3.patch.gz | patch -p1
> >
> > 6. Compile the kernel
> > # make menuconfig
> > Select "File systems --->" from the menu and press enter.
> > Select "Reiser4 (EXPERIMENTAL) (NEW)" and type "M".
> > Press the esc key twice.
> > Select "yes" at the prompt.
>
> Must the rest of the kernel options be configured here as well, or does
> apt-get install the sources with a .config? Most users who know how to
> configure a kernel will probably know the other steps. If the kernel has
> to be configured, is the default Ubuntu .config easily available?
>

Also, the kernel that Ubuntu ships with is now patched with usplash,
and the initrd is dynamically-configured when
linux-kernel-2.6.12-2-i386 or similar is configured if the
usplash-artwork (or ?ubuntu-artwork package, where ? is either k or x)
package is installed (provided on base install with 5.10 and newer).=20
And then the initrd itself is another issue in and of itself -- IIRC,
a large majority of Ubuntu components are built modules, IIRC, even fs
support for most root fses...

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
