class Task {
	var description;
	var isCompleted;

	Task(this.description) : isCompleted = false;

	void setConclusion() {
		isCompleted = true;
	}

	@override
	String toString() {
		return '[${isCompleted ? 'X' : ' '}] $description';
	}
}