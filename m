From: Adrian Phillips <a.phillips@met.no>
Subject: Re: rsync and memory leak on linux 2.2?
Date: 14 Feb 2003 07:38:41 +0100
Sender: "Adrian Phillips,,," <a.phillips@met.no>
Message-ID: <87r8abtlhq.fsf@freeze.oslo.dnmi.no>
References: <1045156304.11405.149.camel@barnes>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1045156304.11405.149.camel@barnes>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick O'Rourke <porourke@egenera.com>
Cc: reiserfs-list@namesys.com

>>>>> "Patrick" == Patrick O'Rourke <porourke@egenera.com> writes:

    Patrick> We have two machines running Linux 2.2 with ReiserFS
    Patrick> v3.5.32 and we're seeing a memory leak which we feel is
    Patrick> related to reiser and some interaction with rsync.

Well, there is a 3.5.34 which has, obviously, a number of bug
fixes. You could try that. I've been running 2.2.20 with this version
for a good number of months on several servers with no problems.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
