From: Hans Reiser <reiser@namesys.com>
Subject: zam, please discuss this
Date: Tue, 22 Jun 2004 19:29:33 -0700
Message-ID: <40D8EB0D.6050109@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010704060305050909020609"
Return-path: <reiserfs-list-return-19300-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alexander Zarochentcev <zam@namesys.com>
Cc: "E. Gryaznova" <grev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

--------------010704060305050909020609
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


http://www.namesys.com/intbenchmarks/mongo/04.05.04/256MB.RAM/comparison/smart-8k.noENTD.vs.ENTD/comp-ENTD.vs.noENTD.html

--------------010704060305050909020609
Content-Type: text/html;
 name="www.namesys.com/intbenchmarks/mongo/04.05.04/256MB.RAM/comparison/smart-8k.noENTD.vs.ENTD/comp-ENTD.vs.noENTD.html"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="www.namesys.com/intbenchmarks/mongo/04.05.04/256MB.RAM/comparison/smart-8k.noENTD.vs.ENTD/comp-ENTD.vs.noENTD.html"
Content-Base: "http://www.namesys.com/intbenchmarks/m
	ongo/04.05.04/256MB.RAM/comparison/
	smart-8k.noENTD.vs.ENTD/comp-ENTD.v
	s.noENTD.html"
Content-Location: "http://www.namesys.com/intbenchmarks/m
	ongo/04.05.04/256MB.RAM/comparison/
	smart-8k.noENTD.vs.ENTD/comp-ENTD.v
	s.noENTD.html"

<html><style>
DT{font-weight: bold}
</style>
<body text=black>
<p>reiser4 _USE_ENTD (1) vs _USE_ENTD (0) </p>
<dl>
<dt>reiser4  </dt>
<dd>ChangeSet@1.1535, 2004-05-04 16:05:39+04:00</dd>
<dt>mem total</dt>
<dd>254476</dd>
<dt>machine  </dt>
<dd>bones</dd>
<dt>kernel   </dt>
<dd>2.6.5 #5 SMP Tue May 4 23:31:17 MSD 2004</dd>
<dt>date     </dt>
<dd>Tue May  4 23:56:49 2004</dd>
<dt>.config  </dt>
<dd>.</dd>
</dl>
<table cols=7 cellpadding=2 cellspacing=2 noborder>
<tr><td bgcolor=black colspan=7><font color=white></td></tr>
<tr>
<th bgcolor=#303030 colspan=7 align=left><font color=white>A.INFO_R4=ChangeSet@1.1535, 2004-05-04 16:05:39+04:00 </font></th>
</tr>
<tr>
<th bgcolor=#303030 colspan=7 align=left><font color=white>B.INFO_R4=ChangeSet@1.1535, ENTD 0 </font></th>
</tr>
<tr> <td colspan=7 bgcolor=#606060><b><font color=white>#0:</font></b></td></tr>
<tr align=center bgcolor=#C0C0C0> <td></td>
<td colspan=2><b>REAL_TIME</b></td>
<td colspan=2><b>CPU_TIME</b></td>
<td colspan=2><b>DF</b></td>
</tr>
<tr align=center bgcolor=#C0C0C0> <td></td>
<td><b>A</b></td><td><b>B/A </b></td>
<td><b>A</b></td><td><b>B/A </b></td>
<td><b>A</b></td><td><b>B/A </b></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>CREATE</b></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 56.94</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.017</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 38.15</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.009</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 1075932</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>COPY</b></td>
<td bgcolor=#E0E0C0 align=right><tt>179.17</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.932</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 61.41</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.060 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 2151692</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>READ</b></td>
<td bgcolor=#E0E0C0 align=right><tt>151.56</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.773</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 54.85</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.121 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 2151692</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>STATS</b></td>
<td bgcolor=#E0E0C0 align=right><tt>91.28</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.572</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt>24.36</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.971</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 2151692</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
</tt></td>
</tr>
<tr>
<td bgcolor=#C0C0C0><b>DELETE</b></td>
<td bgcolor=#E0E0C0 align=right><tt>180.9</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=green> <U>      0.836</U> </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 88.6</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=red>      1.089 </font></tt></td>
</tt></td>
<td bgcolor=#E0E0C0 align=right><tt><U> 4</U></tt></td>
<td bgcolor=#E0E0C0 align=right><tt><font color=black> <U>      1.000</U> </font></tt></td>
</tt></td>
</tr>
<tr><td bgcolor=black colspan=7><font color=white></td></tr>
<tr><td colspan=7 align=right> 
<tr> <td colspan=7 bgcolor=#303030><b><font color=white>GAMMA=0.0 PHASE_READ=find FILE_SIZE=8192 PHASE_DELETE=rm WRITE_BUFFER=4096 PHASE_APPEND=off FSTYPE=reiser4 NPROC=1 DIR=/mnt1 DEV=/dev/hda6 PHASE_COPY=cp SYNC=off PHASE_OVERWRITE=off PHASE_MODIFY=off BYTES=1024000000 REP_COUNTER=1 </td></tr>
<tr><td colspan=7 align=right> <font size=-2>Produced by <a href=http://namesys.com/mongo>Mongo</a> benchmark suite.</font></td></tr>
</table>
<!--
<p><b>Legend:</b> <font color="green">green</font> color means the result is
better (less) than reference value from the first column, results
marked as <font color="red">red</font> are worse than reference value,
best results are <u>underlined</u> other results which fit into 2%
margin of the best result are underlined also.</p>
--></body></html>

--------------010704060305050909020609--
