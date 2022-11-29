public isolated service class ActivitySequencePlanData {
    private ActivitySequencePlan activity_sequence_plan = {
        activity_id: -1,
        sequence_number: -1,
        timeslot_number: -1,
        person_id: -1,
        organization_id: -1,
        created: "",
        updated: ""
     };

    isolated function init(int? activity_id = 0, ActivitySequencePlan? activity_sequence_plan = null) returns error? {
        if(activity_sequence_plan != null) { // if activity_sequence_plan is provided, then use that and do not load from DB
            self.activity_sequence_plan = activity_sequence_plan.cloneReadOnly();
            return;
        }

        int _activity_id = activity_id ?: 0;

        ActivitySequencePlan org_raw;
        if(_activity_id > 0) { // activity_sequence_plan_id provided, give precedance to that
            org_raw = check db_client -> queryRow(
            `SELECT *
            FROM avinya_db.activity_sequence_plan
            WHERE
                activity_id = ${_activity_id};`);
            self.activity_sequence_plan = org_raw.cloneReadOnly();
        } 
        
    }

    isolated resource function get id() returns int? {
        lock {
                return self.activity_sequence_plan.id;
        }
    }

    isolated resource function get activity_id() returns int? {
        lock {
                return self.activity_sequence_plan.activity_id;
        }
    }

    isolated resource function get sequence_number() returns int? {
        lock {
                return self.activity_sequence_plan.sequence_number;
        }
    }

    isolated resource function get timeslot_number() returns int? {
        lock {
                return self.activity_sequence_plan.timeslot_number;
        }
    }

    isolated resource function get person_id() returns int? {
        lock {
                return self.activity_sequence_plan.person_id;
        }
    }

    isolated resource function get organization_id() returns int? {
        lock {
                return self.activity_sequence_plan.organization_id;
        }
    }

    isolated resource function get created() returns string? {
        lock {
                return self.activity_sequence_plan.created;
        }
    }

    isolated resource function get updated() returns string? {
        lock {
                return self.activity_sequence_plan.updated;
        }
    }
    
}
