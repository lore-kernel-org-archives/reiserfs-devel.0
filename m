From: "David Dabbs" <david@dabbs.net>
Subject: Performance improvements to key comparison functions
Date: Wed, 23 Jun 2004 03:43:55 -0500
Message-ID: <20040712084128.DAD3A15E61@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19578-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


It appears that by removing some conditionals in the reiser4 key comparison
functions key comparison performance improves by at least 2x.
Using a purpose-built znode_contains_key_strict and the new comparison code,
cache scanning could be almost three times as fast -- even faster with a
single unsigned char 'hint' member added to the znode structure. 

A writeup, including the timings and the code, is available at

	http://dabbs.net/reiser4


I'd be interested in your feedback.


David Dabbs


