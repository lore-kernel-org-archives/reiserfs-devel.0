From: Redeeman <redeeman@metanurb.dk>
Subject: Re: V4 status
Date: Wed, 03 Dec 2003 16:29:40 +0100
Message-ID: <1070465380.4451.0.camel@redeeman.linux.dk>
References: <16333.14692.61778.304155@pc7.dolda2000.com>
	 <3FCD47C4.50500@ninja.dynup.net>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16211-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FCD47C4.50500@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Wed, 2003-12-03 at 03:17, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Fredrik Tolf wrote:
> 
> >May I ask what the current stability status is for V4? Is there mayhap
> >a HTTP resource for it that I have not found?
> >
> >Fredrik Tolf
> >
> >  
> >
> 
> I believe patching your kernel will not hurt anything else, and mounting 
> a filesystem will probably not hurt anything else.
> 
> I have a laptop on which I use Reiser4 for everything but /boot (as v4 
> is not supported by grub and v3 was never supported very well).  It 
reiserfs 3.6 works perfect in grub here
> seems reasonably stable (once I fixed a problem with xscreensaver).  
> However, I still back up daily, and will continue to do so until someone 
> here tells me I can trust it.  (Then I'll fall back to no backup until I 
> get the tape drive working so I can do proper incremental backups.)
> 
> BTW, to all -- I have had no problems specifically reiser4 related.  I 
> was complaining of crashes earlier, but it seems those were either in my 
> pam libs or my screensaver -- reinstalling all my software seemed to 
> help (and as I didn't touch the kernel, it wouldn't have fixed it if it 
> were a filesystem issue).  In fact, I know for sure it's at least partly 
> due to problems with pam and related things, because my su (among other 
> things) had lost its setuid bit -- due to my using the wrong arguments 
> to cp when upgrading from v3.
> 
> The only thing I might complain about is that, although it was listed as 
> a possibility to display file permissions as files within a file (for 
> example, I should be able to do 'touch file; ls file'), I have had two 
> problems there.  First, ls seems to know it's a file, and so I can't see 
> any files within it.  Second, it needs the executable bit, or I get 
> permission denied errors when trying to look at any files inside it.  
> Third, even with ls not working, no guesses I've made on potential 
> filenames has worked.
> 
> I know almost nothing about the interface behind this.  That said, 
> here's what I'd suggest (without knowing any better):
> - - If I look at something without using a trailing slash, it should be 
> treated as a file, except maybe for compatibility reasons.
> - - If I do use a trailing slash, or as a parent directory to anything, it 
> should be treated as a directory.
> - - If it is a regular file (and not a directory pretending to be a file 
> through some odd plugin -- /etc/passwd could be a file constructed from 
> files in /etc/passwd/) then permission to view it as a directory should 
> be assumed for anyone with read access.  As an alternative, the ability 
> to change into a directory could be implemented as another security 
> attribute, which is automatically linked to executable permission for 
> "normal" directories.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.3 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
> 
> iQIVAwUBP81HyAisZLIF6uqOAQIH9w/9HV/r2hZOGiUKUZjDsToFkNr+HJn+fTsj
> C1imfdKC+tiL9kcI8wfjERFcwj/v6gMCmzXSs/XNRa12cs9Ddm+goeqHhfnjUiO8
> FM0y6m7kebonM957VqJvVhxLfJkZvHjn3aCtHxl3oHfme9Xz7FrZbBpTbDTPA+aY
> wYFFun51dQeIG6P4DqWNUIdEC9UNczdtk+Mhh9QsA9wCcT4bmO3UmiOs0mKN9o6K
> KXsIJCE0DddXxKhROd0RnSY/jKz3KmpTtsNQDekXPaIvMa01qIQOvqv7bbQ/tux8
> OZfYGb8dfR/8TmEIOg7HnrF5agcygpIe2EYb7bwmNi+iT8jA5l4NAOT5EdtzFZxk
> +5hnX3vrSQezoRmr6cYnxgjZtlR5U/tcCZGLcPtvyL5KnxLE83uDBePfQZI8oXd2
> mb4wcrLgmyw02n/m8yE7WMB5ukrj4YKNMIGxLR5u0nuNKJFHFLbqiIshg5ZQY1DF
> CkWMHF1H18Qv6f6zszec4m47hkt/PKpSEArLzMoFA9ag/WtoNrDQq7+iRxy2LYKH
> evK5AIMFAL9v3huxmCphHK6bjQzdTsl4mvnsPjB0hHcp+MhIsyBzobhd27oaBcsv
> Hfj/0RywUwRlRj5zdwuoLuPHYlf38PjZlrAmfENWW2CrOL5+7RgbTGeUe+JU/J+t
> +KlqxdjP1Dc=
> =ExXE
> -----END PGP SIGNATURE-----
-- 
Regards, Redeeman
()  ascii ribbon campaign - against html e-mail 
/\                        - against microsoft attachments


