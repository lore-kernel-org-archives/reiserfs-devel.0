From: Valdis.Kletnieks@vt.edu
Subject: Re: duplicate files and recent changes
Date: Thu, 06 Jun 2002 13:58:15 +0000
Message-ID: <85256BD0.00610F65.00@patapsco.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 Boundary="0__=9TsqXbTjW1uPGBFpZG1j983fjw2vjjlTP5ehk64dqriazMOscffIhhKv"
Return-path: <reiserfs-list-return-10566-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: "S. Alexander Jacobson" <alex@shop.com>, reiserfs-list@namesys.com

--0__=9TsqXbTjW1uPGBFpZG1j983fjw2vjjlTP5ehk64dqriazMOscffIhhKv
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline

                                                                  
 (Embedded                                                        
 image moved   Valdis.Kletnieks@vt.edu                            
 to file:      06/06/2002 09:58 AM                                
 pic19373.pcx)                                                    
                                                                  








 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic27832.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic30803.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic04969.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic08117.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic11628.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic06033.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic18619.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic14738.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic07549.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic26942.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic27268.pcx)









 (Embedded
 image moved   Valdis.Kletnieks@vt.edu
 to file:      06/06/2002 09:58 AM
 pic24632.pcx)








On Thu, 06 Jun 2002 13:25:05 +0400, Oleg Drokin said:

> But MD5 may be identical for different files.

Only a 2**128 chance of that.  If you know a way to force a hash collision
more frequently than that, the crypto world wants to hear from you.. ;)

> Also this buys you nothing.
> You write file in chunks, once file is identical to other file,
> one of the files deleted. Looks like just more extra work (but some saved
space
> of course).

A much more productive way to save space is file-system compression.  AIX
supports LZ-compressing each 4K block and then only saving as many 512 byte
fragments as actually needed.  It's a big win - /usr (even with all the
binaries)
needs about 30% less space, and I've seen over 50% for file systems with
source trees in them...
--
                    Valdis Kletnieks
                    Computer Systems Senior Engineer
                    Virginia Tech


--0__=9TsqXbTjW1uPGBFpZG1j983fjw2vjjlTP5ehk64dqriazMOscffIhhKv--

