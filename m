From: Adrian Phillips <a.phillips@met.no>
Subject: Re: problems with /var/lib/dpkg/info
Date: 11 Aug 2002 09:04:37 +0200
Sender: "Adrian Phillips,,," <a.phillips@dnmi.no>
Message-ID: <wvlm7dho56.fsf@freeze.oslo.dnmi.no>
References: <20020810090529.GA411@home>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020810090529.GA411@home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Radim Kolar <hsn@cybermail.net>
Cc: reiserfs-list@namesys.com

>>>>> "Radim" == Radim Kolar <hsn@cybermail.net> writes:

    Radim> I have 3 debian gnu linux machines here with reiserfs. I am
    Radim> using reiserfs about 2 years and when i have some kind of
    Radim> problem with reiserfs - it is allways with
    Radim> /var/lib/dpkg/info directory.  It looks like there is too
    Radim> many hash collisions or reiserfs do not likes long
    Radim> directories.

    Radim> Because of my previous bad experiences with losing this
    Radim> directory - i am using rdist to backup it now. In some
    Radim> cases both directories (original and backup) are corrupted.

I have also been running with reiser using 3.5 format for a couple of
years on Debian without problems using r5 hash. What hash have you
been formatting with ? (and how much difference does it make ?),

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
