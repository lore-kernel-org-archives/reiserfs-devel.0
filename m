From: Tom Vier <tmv@comcast.net>
Subject: Re: Can compression at filesystem level improve	overall	performance?
Date: Mon, 29 Mar 2004 00:25:05 -0500
Message-ID: <20040329052505.GB19372@zero>
References: <405B02ED.4010602@solidcode.net> <1079713790.9729.1.camel@redeeman.linux.dk> <16475.9613.375262.677576@laputa.namesys.com> <1079978427.4658.63.camel@localhost.localdomain> <405F46D8.1040607@namesys.com> <1080011016.4658.408.camel@localhost.localdomain> <4060189B.2000500@namesys.com> <1080145163.4658.1314.camel@localhost.localdomain>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1080145163.4658.1314.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, Mar 24, 2004 at 11:19:23AM -0500, Scott Young wrote:
> Additional metadata could identify the program and the user that made
> that specific version of a file, and any malicious changes can be
> selectively rolled back.  An administrator may use the metadata to audit
> the changes a file made to the filesystem, or a program could be run in
> a jail where the changes it makes to the filesystem are only visible to
> itself.  Versioning opens up a plethora of possibilities for data
> security.

or you could just chattr +i, and avoid changes in the first place. 8)

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
