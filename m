From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: mongo.pl: 2.6.9-cko3, xattrs + journaling
Date: Mon, 22 Nov 2004 13:52:44 +0100
Message-ID: <200411221352.44802.christian.mayrhuber@gmx.net>
References: <200411201742.25912.christian.mayrhuber@gmx.net> <419F94C5.9070204@namesys.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_cEeoBhhhsI7QJ7Q"
Return-path: <reiserfs-list-return-22489-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <419F94C5.9070204@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_cEeoBhhhsI7QJ7Q
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 20 November 2004 20:02, you wrote:
> Christian Mayrhuber wrote:
> 
> >Hi,
> >
> >I did some runs of mongo to see how the journaling filesystems compare to 
each 
> >other on a recent kernel.
> >My focus has been how the fs's compare with enabled acls and xattrs.
> >
> >Summary:
> >--------
> >1) data=ordered + acl: reiserfs is best for writing, ext3 for reading.
> >   I guess reiserfs becomes slow on reading with acls because it has to
> >   open two files?
> >   Reiserfs halfes the stat performance when acl's are enabled.
> >2) No data=ordered, but acl: jfs seems to be best.
> >   I also tried jfs with the case-insensitive mount option, with 
neglectable
> >   different results.
> >   xfs cannot win over jfs, even for large files.
> >3) data=ordered, no acl: reiserfs outperforms even jfs 
> >
> >I've been using the ck "overloaded" patch to get reiser4 into the stable 
> >kernel. Reiser4 is the one from 2.6.9-mm1 and it's in just for curiosity.
> >Reiser4 is best on space, but slow on modify, overwrite and delete
> >  
> >
> I don't think the modify phase is legitimately designed.  Real 
> applications are not fully random in what they modify, and if they are, 
> it requires a repacker to fix it right.  That is why we don't use it for 
> general purpose benchmarking.  Nikita disagrees with me.

I ran "dbench -c client_oplocks.txt" (no sync) with 50 clients.
DBench-2.0 and client_oplocks.txt are from a debian sarge install.
The mount options are "noatime,nodiratime".
Tests run, again on /dev/loop0.

reiserfs: Throughput 5.92739 MB/sec 50 procs
ext3: Throughput 6.41044 MB/sec 50 procs
jfs: Throughput 5.92622 MB/sec 50 procs
jfs, case insensitive: Throughput 6.23852 MB/sec 50 procs
xfs: Throughput 6.08939 MB/sec 50 procs
reiser4: crash, after spawning around 10 of the 50 clients.

> To make  
> reiser4 fast at deletes, use -o extent40.
Hmm, "mkfs.reiser4 -q -o extent=extent40" does not help much for deletes.
As DELETE is horribly slow I guess its a bad interaction between
/dev/loop0 and reiser4, or it's the -cko3 kernel patch.

-- 
lg, Chris


--Boundary-00=_cEeoBhhhsI7QJ7Q
Content-Type: text/html;
  charset="iso-8859-1";
  name="results.html"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="results.html"

<html><style>
DT{font-weight: bold}
</style>
<body text=black>
<dl>
<dt>reiser4  </dt>
<dd>2.6.9-cko3</dd>
<dt>mem total</dt>
<dd>516532</dd>
<dt>machine  </dt>
<dd>byblos</dd>
<dt>kernel   </dt>
<dd>2.6.9-k7-cko3 #1 Fri Nov 19 20:13:50 CET 2004</dd>
<dt>date     </dt>
<dd>Fre 19 Nov 2004 21:37:51 CET</dd>
<dt>.config  </dt>
<dd>PLEASE take care to make .config file available when you publish benchmark results. At namesys, .config should be stored somewhere in the internal benchmark directory (intbenchmarks/mongo/), and link to it is added to the resulting html document.</dd>
</dl>
<table cols=33 cellpadding=2 cellspacing=2 noborder>
<tr><td bgcolor=black colspan=33><font color=white></td></tr>
<tr>
<th bgcolor=#303030 colspan=29 align=left><font color=white>A. FSTYPE=reiserfs MKFS=mkfs.reiserfs -q MOUNT_OPTIONS="user_xattr,acl,attrs"</font></th>
</tr>
<tr>
<th bgcolor=#303030 colspan=29 align=left><font color=white>B. FSTYPE=ext3 MKFS=mkfs.ext3 -q -O dir_index,filetype,has_journal,sparse_super -q MOUNT_OPTIONS="user_xattr,acl"</font></th>
</tr>
<tr>
<th bgcolor=#303030 colspan=29 align=left><font color=white>C. FSTYPE=xfs MKFS=mkfs.xfs -f MOUNT_OPTIONS="defaults"</font></th>
</tr>
<tr>
<th bgcolor=#303030 colspan=29 align=left><font color=white>D. FSTYPE=jfs MKFS=mkfs.jfs -q MOUNT_OPTIONS="defaults"</font></th>
</tr>
<tr>
<th bgcolor=#303030 colspan=29 align=left><font color=white>E. FSTYPE=reiserfs MKFS=mkfs.reiserfs -q MOUNT_OPTIONS="notail,nouser_xattr,noacl,noattrs,nodiratime,noatime"</font></th>
</tr>
<tr>
<th bgcolor=#303030 colspan=29 align=left><font color=white>F. FSTYPE=ext3 MKFS=mkfs.ext3 -q -O dir_index,filetype,has_journal,sparse_super -q MOUNT_OPTIONS="noatime,nouser_xattr,noacl"</font></th>
</tr>
<tr>
<th bgcolor=#303030 colspan=29 align=left><font color=white>G. FSTYPE=reiser4 MKFS=mkfs.reiser4 -q MOUNT_OPTIONS="defaults"</font></th>
</tr>
<tr>
<th bgcolor=#303030 colspan=33 align=left><font color=white>H.INFO_R4=2.6.9-cko3 FSTYPE=reiser4 MKFS=mkfs.reiser4 -q -o extent=extent40 MOUNT_OPTIONS="defaults" </font></th>
</tr>
<tr> <td colspan=33 bgcolor=#606060><b><font color=white>#0:FSTYPE=reiserfs MKFS=mkfs.reiserfs -q MOUNT_OPTIONS="user_xattr,acl,attrs" </font></b></td></tr>
<tr align=center bgcolor=#C0C0C0> <td></td>
<td colspan=8><b>REAL_TIME</b></td>
<td colspan=8><b>CPU_TIME</b></td>
<td colspan=8><b>CPU_UTIL</b></td>
<td colspan=8><b>DF</b></td>
</tr>
<tr align=center bgcolor=#C0C0C0> <td></td>
<td><b>A</b></td><td><b>B/A </b></td><td><b>C/A </b></td><td><b>D/A </b></td><td><b>E/A </b></td><td><b>F/A </b></td><td><b>G/A </b></td><td><b>H/A </b></td>
<td><b>A</b></td><td><b>B/A </b></td><td><b>C/A </b></td><td><b>D/A </b></td><td><b>E/A </b></td><td><b>F/A </b></td><td><b>G/A </b></td><td><b>H/A </b></td>
<td><b>A</b></td><td><b>B/A </b></td><td><b>C/A </b></td><td><b>D/A </b></td><td><b>E/A </b></td><td><b>F/A </b></td><td><b>G/A </b></td><td><b>H/A </b></td>
<td><b>A</b></td><td><b>B/A </b></td><td><b>C/A </b></td><td><b>D/A </b></td><td><b>E/A </b></td><td><b>F/A </b></td><td><b>G/A </b></td><td><b>H/A </b></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>CREATE</b></td>
<td bgcolor=#E0E0C0 align=right><tt>336.71</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.969 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.649 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.612 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.711 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.711 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.403</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.431 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>38.11</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.701 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.645 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.447</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.896 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.697 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.134 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.186 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>17.57</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.894</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.451 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.204 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.311 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.176 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      2.739 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      2.653 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>3563436</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.031 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.018 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.027 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.012 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.031 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.978</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.978</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>COPY</b></td>
<td bgcolor=#E0E0C0 align=right><tt>446.56</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.175 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.089 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.969 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.808</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.135 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.866 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.913 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>47.25</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.680 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.777 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.516</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.931 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.655 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.255 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.311 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>19.29</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.736</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.923 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.815 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.160 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.730</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.354 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.319 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>7126920</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.031 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.018 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.027 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.012 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.031 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.978</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.978</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>APPEND</b></td>
<td bgcolor=#E0E0C0 align=right><tt>1044.31</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.045 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.935 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.867</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.868</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.019 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.980 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.970 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>47.25</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.616 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.581 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.424</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.864 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.606 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.423 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.406 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>8.52</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.829</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      0.982 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.905 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.062 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.836</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.561 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.527 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 10491608</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.020</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.009</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.015</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.006</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.020</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.007</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.007</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>MODIFY</b></td>
<td bgcolor=#E0E0C0 align=right><tt>1509.01</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.057 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.840 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.809</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.850 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.925 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.468 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.476 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>15.48</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.716 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.924 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.522</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.693 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.641 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.392 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.410 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 2.60</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.015</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.285 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.227 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.038 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.008</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      2.642 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      3.142 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 10492004</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.020</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.009</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.015</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.006</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.020</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.007</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.007</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>OVERWRITE</b></td>
<td bgcolor=#E0E0C0 align=right><tt>1548.84</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.245 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.816 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.788</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.811 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.211 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.731 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.742 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>44.71</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.817 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.838 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.611</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.874 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.780 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.483 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.503 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>7.99</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.900 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.235 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.069 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.163 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.795 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.758</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.772</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 10492736</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.020 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.009</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.015</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.006</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.020 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.997</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.997</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>READ</b></td>
<td bgcolor=#E0E0C0 align=right><tt>1631.94</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.465 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.524 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.627 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.419</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.432 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.631 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.646 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>30.05</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.720 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.936 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.662</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.865 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.649</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.426 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.410 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 6.68</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.672 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.585 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.274 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.811 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.626 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.412 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.385 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 10492736</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.020 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.009</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.015</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.006</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.020 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.997</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.997</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>STATS</b></td>
<td bgcolor=#E0E0C0 align=right><tt>142.18</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.224</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.400 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.703 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.493 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.224</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.600 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.609 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>4.83</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.874 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.932 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.839</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.907 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.828</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.215 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.190 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 5.70</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      2.674 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      3.528 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.063 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.337 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      2.582 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.411 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.375 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 10492736</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.020 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.009</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.015</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.006</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.020 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.997</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.997</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>DELETE</b></td>
<td bgcolor=#E0E0C0 align=right><tt>45.45</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      8.237 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.696 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.726 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.501</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      7.788 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>     15.589 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>     15.570 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>18.12</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.638 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.848 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.482</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      0.998 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.571 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      2.161 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      2.113 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>41.06</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.120 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.331 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.444 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.929 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.092</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.158 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.155 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 0</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt>0/0</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>63400/0</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>9068/0</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>0/0</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>0/0</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>4/0</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>8/0</tt></td>
</tt></td>
</tr>
<tr> <td colspan=33 bgcolor=#606060><b><font color=white>#1:DD_MBCOUNT=9216 </font></b></td></tr>
<tr align=center bgcolor=#C0C0C0> <td></td>
<td colspan=8><b>REAL_TIME</b></td>
<td colspan=8><b>CPU_TIME</b></td>
<td colspan=8><b>CPU_UTIL</b></td>
<td colspan=8><b>DF</b></td>
</tr>
<tr align=center bgcolor=#C0C0C0> <td></td>
<td><b>A</b></td><td><b>B/A </b></td><td><b>C/A </b></td><td><b>D/A </b></td><td><b>E/A </b></td><td><b>F/A </b></td><td><b>G/A </b></td><td><b>H/A </b></td>
<td><b>A</b></td><td><b>B/A </b></td><td><b>C/A </b></td><td><b>D/A </b></td><td><b>E/A </b></td><td><b>F/A </b></td><td><b>G/A </b></td><td><b>H/A </b></td>
<td><b>A</b></td><td><b>B/A </b></td><td><b>C/A </b></td><td><b>D/A </b></td><td><b>E/A </b></td><td><b>F/A </b></td><td><b>G/A </b></td><td><b>H/A </b></td>
<td><b>A</b></td><td><b>B/A </b></td><td><b>C/A </b></td><td><b>D/A </b></td><td><b>E/A </b></td><td><b>F/A </b></td><td><b>G/A </b></td><td><b>H/A </b></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>dd_writing_largefile</b></td>
<td bgcolor=#E0E0C0 align=right><tt>1625.04</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.862 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.915 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.009 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.872 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.874 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.774 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.756</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>108.98</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.410 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.809</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.063 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.979 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.469 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.044 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.057 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 17.53</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.396 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.015</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.052 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.127 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.354 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.270 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.329 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 9446568</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.006</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.999</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.999</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>dd_reading_largefile</b></td>
<td bgcolor=#E0E0C0 align=right><tt>891.95</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.942</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.078 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.950 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.945</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.934</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.936</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.931</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>88.07</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.869 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.841</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.856</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.972 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.862 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.945 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green>      0.960 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>22.70</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.022 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.924</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.004 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.048 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black>      1.012 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.140 </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.156 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 9446568</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.006</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.999</U> </font></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      0.999</U> </font></tt></td>
</tt></td>
</tr>
<tr><td bgcolor=black colspan=33><font color=white></td></tr>
<tr><td colspan=33 align=right> 
<tr> <td colspan=33 bgcolor=#303030><b><font color=white>NPROC=1 DIR=/mnt SYNC=off REP_COUNTER=3 GAMMA=0.2 DEV=/dev/loop0 DD_MBCOUNT=9216 WRITE_BUFFER=4096 BYTES=1000000000 FILE_SIZE=16900 </td></tr>
<tr><td colspan=33 align=right> <font size=-2>Produced by <a href=http://namesys.com/mongo>Mongo</a> benchmark suite.</font></td></tr>
</table>
<!--
<p><b>Legend:</b> <font color="green">green</font> color means the result is
better (less) than reference value from the first column, results
marked as <font color="red">red</font> are worse than reference value,
best results are <u>underlined</u> other results which fit into 2%
margin of the best result are underlined also.</p>
--></body></html>

--Boundary-00=_cEeoBhhhsI7QJ7Q--
