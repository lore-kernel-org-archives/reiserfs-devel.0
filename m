From: Adrian Phillips <a.phillips@met.no>
Subject: Re: Journal writes hanging in presence of I/O errors
Date: 09 Aug 2002 07:43:22 +0200
Sender: "Adrian Phillips,,," <a.phillips@dnmi.no>
Message-ID: <wv8z3g4mf9.fsf@freeze.oslo.dnmi.no>
References: <1028828929.9189.25.camel@spoon.durables.org>
	<1028836637.5940.16.camel@oberon.rnd.esoft.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1028836637.5940.16.camel@oberon.rnd.esoft.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

>>>>> "Jonathan" == Jonathan Briggs <jbriggs@esoft.com> writes:

    Jonathan> Bad blocks and disk errors are a problem for every file
    Jonathan> system.  Modern hard drives handle bad sectors by using
    Jonathan> the firmware to relocate to a good sector.  The Linux
    Jonathan> kernel should have another layer (LVM, probably) between
    Jonathan> the hard drive and the file system that can do the same

EVMS has something for handling bad blocks.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
