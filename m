From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 snapshot
Date: Tue, 23 Dec 2003 16:07:07 +0300
Message-ID: <16360.15867.203405.266401@laputa.namesys.com>
References: <16360.8933.883691.281877@laputa.namesys.com>
	<3FE83374.8070803@Rotanovs.com>
	<16360.13704.279272.690355@laputa.namesys.com>
	<3FE83CCD.6040708@Rotanovs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FE83CCD.6040708@Rotanovs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viktors Rotanovs <Viktors@Rotanovs.com>
Cc: Reiserfs-List@Namesys.COM

Viktors Rotanovs writes:
 > Nikita Danilov wrote:
 > 
 > > > Also, does lack of sendfile in the current snapshot mean that Apache 
 > > > will lose in performance when serving from Reiser4 partition?
 > >
 > > Hmm, what Apache uses sendfile for?
 > 
 > 
 > It uses it to send static content to client. Quote from Apache 2 docs:
 > 
 > "In situations where Apache 2.0 can ignore the contents of the file to 
 > be delivered -- for example, when serving static file content -- it 
 > normally uses the kernel sendfile support the file if the OS supports 
 > the |sendfile(2)| operation."
 > 
 > "On most platforms, using sendfile improves performance by eliminating 
 > separate read and send mechanics."

Current reiser4 will be slower than hypothetical reiser4-with-sendfile,
but not necessary slower than, say, ext3.

 > 
 > Best Wishes,
 > Viktors
 > 

Nikita.
