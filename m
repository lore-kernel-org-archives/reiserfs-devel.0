From: lrc1@st-andrews.ac.uk
Subject: Saved Re: A bold idea (Re: Carrying Attributes too Far)
Date: Sun,  7 Dec 2003 06:37:29 +0000
Message-ID: <1070779049.3fd2caa92e046@webmail.st-andrews.ac.uk>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD0023D.5030500@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16274-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD0023D.5030500@ninja.dynup.net>
Content-Transfer-Encoding: 8bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: David Masover <jedi@ninja.dynup.net>

Quoting David Masover <jedi@ninja.dynup.net>:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> lrc1@st-andrews.ac.uk wrote:
> 
> >Quoting Hans Reiser <reiser@namesys.com>:
> >
> >...
> >
> >  
> >
> >>lrc1@st-andrews.ac.uk wrote:
> >>
> >>    
> >>
> >>>Sorry for the delay in replying.
> >>>
> >>>Quoting Hubert Chan <hubert@uhoreg.ca>:
> >>>      
> >>>
> >
> >...
> >
> >  
> >
> >>>Yes, it is impossible to hard-link between two files on different volumes
> >>>(except at mount points) in the Unix filesystem, but it shouldn't be.
> (More
> >>>generally, with the necessary permissions it should be possible to make
> any
> >>>      
> >>>
> >>file
> >>    
> >>
> >>>the child of any directory via a hard link, except where doing so would
> >>>      
> >>>
> >>create a
> >>    
> >>
> >>>cycle.) 
> >>>
> >>>      
> >>>
> >>This implies that two filesystems can share an identification number
> >>between them.
> >>    
> >>
> >
> >I would suggest that for every link to a file on a different filesystem,
> the
> >linking directory should store both an identifier for the child file's
> >filesystem and the child file's on-disk inumber on that filesystem.* The
> reverse
> >
> >  
> >
> Here's a crazy idea -- maybe performance can be improved to the point 
> where it's actually more efficient to have one large partition to begin 
> with?  Back to hda1 is /boot, hda2 is /, and hda3 is swap?
> 
> That gets rid of the hardlink problem, and also the problem of making 
> decisions about partitioning.  Other features of Reiser4 like plugins 
> eliminate any need that might arise from things like Cryptoloop.  In 
> fact, maybe other filesystems will be implemented as Reiser4 plugins to 
> a .img file, but that's probably going a bit far.
> 

It may or may not be a generally good idea to use fewer HD partitions, but
you'll never get it to the point where there is no need for hard links across
filesystems. Consider: a normal computer setup might well use any or all of a
floppy disk, a DVD-ROM drive, a memory card reader, and an NFS share on a remote
server. Perhaps you could "mount" all of these using Reiser* plugins, but in
doing so you basically end up replicating the kernel's filesystem interface inside 

> I agree that hardlinking directories should be allowed, and I think it's 
> worth it to check whether it creates a loop, unless rm can be modified 
> to simply rm the directory, and the filesystem (and maybe VFS) would be 
> modified to have directories have link counts that don't include . or 
> .., so when a directory is to be deleted, the system does its own manual 
> deletion of each of the files within it.  Then, if I type 'rm loop' and 
> it removes the link of 'loop/loop' to 'loop', there are now no more 
> links to 'loop' and it gets destroyed.
> 
> I'm a teenager, I have the right to try to be revolutionary!
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.3 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
> 
> iQIVAwUBP9ACPQisZLIF6uqOAQJ4eg//SYc9UiV3AY1uNKXLQhRMKvFmDiRqNcf+
> dMPNso/ezC1asVHPLMy3Evi7Ti9gikFNVdXuPNkAC6WvkcrM2T2UmgT+JhxrrxQh
> serPDXBVaCsb6/vMLp3bTC3h8/VVoJKYEQqOWKhQd3e0AwDFtbFzCVRo1Du+YB4k
> Ud3JRRZIB+3aKhL2mgGM+yH1A6GUSAKFJ/xNDvxOehphOoRulAQCckdSpLK30wum
> E2QDmtL7kNX7qX2rwVfiBKPEFc1fmQatAo3krAaEqAgiT6WU0/0Xt6beNNRhtyUV
> u2Ja5vCvMorzpPSAGPXzJ/JFIr/fhiFxua8f3+dxzniND0iWCGhTTj/roT6Lvo1t
> AFDjJA6r8bx++VHw/sSgKaV+8Fsdc0CO/ipvj2MZ1w8DHFkMoI1ADlRI1wYLtD9x
> ebBJLmJioshrxp31EE60yAweMt7/xfKtfoNuUaCsmoJjnhxG5t3b7gk+miRhNbO0
> YCg86o8rSDZFMUfj3F8YjbuSiGclDcXlk5WcFR36V4IP7o/pknvvuzk8WIGfzg/z
> ckxS/hBOXHdop8o9a4GtLrrTKiXej9iveuT7RlV0a1k/QWol76r971nKQht0I2c6
> a4PWp3MEeZeKbs8yKxdAvPbuII3AoxFEaaoXvxj5+EPi7WYTQNONbl+42/ENCS0i
> CMWbiSaczJ0=
> =GLez
> -----END PGP SIGNATURE-----
> 
> 




-----------------------------------------------------------------
University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
