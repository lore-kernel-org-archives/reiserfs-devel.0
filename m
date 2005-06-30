From: Kevin Bowen <kevin@ucsd.edu>
Subject: Re: reiser4 plugins
Date: Thu, 30 Jun 2005 13:08:42 -0700
Message-ID: <1120162123.22241.53.camel@punchline.ucsd.edu>
References: <200506301847.j5UIlp6u012775@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506301847.j5UIlp6u012775@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Hubert Chan <hubert@uhoreg.ca>, Hans Reiser <reiser@namesys.com>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>


> might be nice to have on exclusively one-user, isolated machines, like
> "keep /my/ annotations/icon/application name/whatever with the file's
> data", but that break down in multiuser (even serially, one user after the

If this is really the core of your (and the rest of the reiser-
obstructionist crowd's) objection to the file-as-directory concept, then
you just haven't thought it through thoroughly enough. Ignore for the
moment the case of system-wide or network-wide shared data, and think
about it just limited to a user's home directory, and the storage and
organization of actual *data* (as opposed to system files). The desire
amongst users for ubiquitous metadata is very real - the current wave of
"desktop search" products and technologies demonstrates this - but
search is really only the lowest-hanging fruit of this new way of
looking at data. Application-layer solutions like Beagle, Google Desktop
Search et al allow for querying on metadata, but actually *acting* on
the results of those queries requires that they be exposed via first
class primitives which can be manipulated with arbitrary tools, not via
some proprietary userland api which only one tool ever actually
implements. 

As to the case of system-wide shared files, there is already a mechanism
to prevent users from inappropriately annotating files that don't belong
to them: file permissions. If you're sysadmining a multiuser reiser4
box, and your users are able to modify the metadata of files they don't
own, then you go to sysadmin purgatory. 

> other way; OpenOffice /has/ structured files, XML inside zipped files,
Java
> also uses zip files for its structuring needs, etc), or are ideas that

And as a Java developer, I can tell you that the wide consensus is that
this solution is half-assed and insufficient for both developers and
users needs. In fact, I believe there is currently a JSR in progress to
develop a more sophisticated Java packaging model.

-- 
kevin@ucsd.edu
