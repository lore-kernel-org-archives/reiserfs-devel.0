From: Oleg Drokin <green@namesys.com>
Subject: Re: Overwritten files
Date: Tue, 16 Apr 2002 13:19:49 +0400
Message-ID: <20020416131949.A9881@namesys.com>
References: <20020416105325.2a854a19.ikkeswar@dds.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020416105325.2a854a19.ikkeswar@dds.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rutger Swarts <ikkeswar@dds.nl>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Tue, Apr 16, 2002 at 10:53:25AM +0200, Rutger Swarts wrote:

> Now my question:
> Is this a known issue? if yes: what can I do about it? if no: what information do you need to reproduce/solve this problem? (stop it from happening again, that is)

No. This is not known issue. Look at the mtime of file in question.
If it is not changed, chances are you hit disk driver error
(or if you run windows on this box, the windows error).
This does not look like reiserfs problem, though.

Bye,
    Oleg
