From: Hubert Mantel <mantel@suse.de>
Subject: Re: reiserfsck not fixing vs-5150/vs-13070
Date: Thu, 29 Aug 2002 13:12:37 +0200
Message-ID: <20020829111237.GO21461@suse.de>
References: <20020828203754.GA11894@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11341-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020828203754.GA11894@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list <reiserfs-list@namesys.com>

Hi,

On Wed, Aug 28, Matthias Andree wrote:

> I have some difficulties with a file system here. SuSE 2.4.19-4GB #1
> kernel, file system in reiserfs 3.6 format with r5 hash:

This is an unofficial kernel with lots of new features and work in
progress. The README file explicitly warns not to use this one on a
production system yet. Depending on the version you are using, there
exists even a random memory corruption bug that only recently got fixed.

> Matthias Andree
                                                                  -o)
    Hubert Mantel              Goodbye, dots...                   /\\
                                                                 _\_v
