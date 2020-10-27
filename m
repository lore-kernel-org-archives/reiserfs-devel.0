From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: PROBLEM: Reiser4 hard lockup
Date: Tue, 27 Oct 2020 15:36:33 -0400
Message-ID: <20201027193633.GE5691@mit.edu>
References: <20201025090422.D80F56FB40E1@huitzilopochtli.metztli-it.com>
 <20201025210758.034aa947@Phenom-II-x6.niklas.com>
 <2e2f8dc4-a48e-f09c-3f41-5dfa7f9a6387@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2e2f8dc4-a48e-f09c-3f41-5dfa7f9a6387@gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: David Niklas <Hgntkwis@vfemail.net>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 27, 2020 at 01:53:31AM +0100, Edward Shishkin wrote:
> > > reiser4progs 1.1.x Software Framework Release Number (SFRN) 4.0.1 file
> > > system utilities should not be used to check/fix media formatted 'a
> > > priori' in SFRN 4.0.2 and vice-versa.
> > 
> > Honestly, this is the first time I've heard about a Linux FS having
> > versioning other than a major one
> 
> This is because, unlike other Linux file systems, reiser4 is a
> framework.
> 
> In vanilla kernel having a filesystem-as-framework is discouraged for
> ideological reasons. As they explained: "nobody's interested in
> plugins". A huge monolithic mess without any internal structure -
> welcome :)

I wouldn't call it an ideological problem, but more about wanting to
assure interoperability issues and wanting to reduce confusion on the
part of users, especially if images get moved between systems.  There
is also plenty of way of introducing internal structure and code
cleanliness without going completely undisciplined with respect to
on-disk format extensions.  :-)

Finally, I'll note that ext 2/3/4 does have a rather fine-grained set
of feature flags, with specific rules about what the kernel --- and
e2fsck --- should do if it finds a feature bit it doesn't understand
in the incompat, ro_compat, and compat feature flags set.  This is
especially helpful since we have multiple implementations of ext 2/3/4
out there (in FreeBSD, the GRUB bootloader, GNU HURD, Fuchsia, etc.)
and so using feature bits allow for safe and reliable interoperability
with the user being warned if they can safely only mount the file
system read-only, or not at all, if the file system has some new
feature that their current OS version does not support.  We can also
give appropriate warnings if they are using an insufficiently recent
version of the userspace tools.

Cheers,

					- Ted
