From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe@gramoulle.com>
Subject: Re: 2.6.18-rc3 - ReiserFS - warning: vs-8115: get_num_ver: not
 directory or indirect item
Date: Sun, 30 Jul 2006 22:37:26 +0200
Message-ID: <20060730203726.E5F7E16D7@philou.gramoulle.local>
References: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
	<p737j1v3sum.fsf@verdi.suse.de>
	<9a8748490607301039k1057da87i237ee42e83f8ef4b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9a8748490607301039k1057da87i237ee42e83f8ef4b@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello Jesper,

On Sun, 30 Jul 2006 19:39:07 +0200
"Jesper Juhl" <jesper.juhl@gmail.com> wrote:

  | they don't seem to have caused any trouble/corruption here, so if you
  | haven't experienced any problems either I think I'll relax and just
  | wait for an explanation from some reiserfs folks.
  | 
  | Thank you for replying - nice to know that I'm not the only one seeing
  | this and that it's not something that has caused massive troubles for
  | someone else.

I reported such a message back in May 2004 ( kernel 2.6.6-rc3 ), to which 
Vladimir replied :

On Thu, 06 May 2004 14:43:22 +0400
Vladimir Saveliev <vs@namesys.com> wrote:

  | I guess that warning became obsolete when Oleg <green@clusterfs.com>
  | added possibility to insert long indirect items.

Then Hans asked for that warning to be removed, and i guess it must have slipped through
the TODO list :)

Thanks,

Philippe
